
-- 1) Where are the items stored and if they were rearranged, could a warehouse be eliminated?
-- This query provides insights into the current distribution of products and can help in evaluating the feasibility of warehouse consolidation based on the volume and 
-- types of products stored in each warehouse
-- By examining the distribution of products across warehouses, we can assess whether rearranging inventory could potentially lead to the consolidation or elimination of a warehouse.

SELECT
    p.`productCode`,
    p.`productName`,
    p.`quantityInStock`,
    p.`warehouseCode`,
    w.`warehouseName`,
    COUNT(*) AS numProductsInWarehouse
FROM
    `mintclassics`.`products` p
JOIN
    `mintclassics`.`warehouses` w ON p.`warehouseCode` = w.`warehouseCode`
GROUP BY
    p.`productCode`, p.`productName`, p.`quantityInStock`, p.`warehouseCode`, w.`warehouseName`
ORDER BY
    p.`productCode`, numProductsInWarehouse DESC;


-- 2) How are inventory numbers related to sales figures? Do the inventory counts seem appropriate for each item?
-- By comparing the quantity in stock with the total quantity ordered and sold for each item, 
-- you can assess whether the inventory counts seem appropriate and whether there are any discrepancies or areas for improvement in inventory management.
SELECT
    p.`productCode`,
    p.`productName`,
    p.`quantityInStock`,
    SUM(od.`quantityOrdered`) AS totalQuantityOrdered,
    SUM(CASE WHEN o.`status` = 'Shipped' THEN od.`quantityOrdered` ELSE 0 END) AS totalQuantitySold
FROM
    `mintclassics`.`products` p
LEFT JOIN
    `mintclassics`.`orderdetails` od ON p.`productCode` = od.`productCode`
LEFT JOIN
    `mintclassics`.`orders` o ON od.`orderNumber` = o.`orderNumber`
GROUP BY
    p.`productCode`, p.`productName`, p.`quantityInStock`
ORDER BY
    p.`productCode`;

-- 3) Are we storing items that are not moving? Are any items candidates for being dropped from the product line?
-- By executing this query, you can identify products that are not moving or have very low sales activity. 
-- These products may be candidates for being dropped from the product line to optimize inventory management and focus resources on more profitable items. 
SELECT
    p.`productCode`,
    p.`productName`,
    p.`quantityInStock`,
    SUM(od.`quantityOrdered`) AS totalQuantityOrdered
FROM
    `mintclassics`.`products` p
LEFT JOIN
    `mintclassics`.`orderdetails` od ON p.`productCode` = od.`productCode`
LEFT JOIN
    `mintclassics`.`orders` o ON od.`orderNumber` = o.`orderNumber`
GROUP BY
    p.`productCode`, p.`productName`, p.`quantityInStock`
HAVING
    totalQuantityOrdered IS NULL OR totalQuantityOrdered = 0
ORDER BY
    p.`productCode`;
