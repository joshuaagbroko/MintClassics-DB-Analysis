SELECT
    w.`warehouseCode`,
    w.`warehouseName`,
    w.`warehousePctCap`,
    SUM(p.`quantityInStock`) AS totalQuantityInStock,
    SUM(od.`quantityOrdered`) AS totalQuantityOrdered,
    ROUND(SUM(p.`quantityInStock`) / w.`warehousePctCap` * 100, 2) AS usagePercentage
FROM
    `mintclassics`.`warehouses` w
LEFT JOIN
    `mintclassics`.`products` p ON w.`warehouseCode` = p.`warehouseCode`
LEFT JOIN
    `mintclassics`.`orderdetails` od ON p.`productCode` = od.`productCode`
GROUP BY
    w.`warehouseCode`, w.`warehouseName`, w.`warehousePctCap`
ORDER BY
    usagePercentage DESC;


-- Calculating Sales Revenue
SELECT 
	p.productCode,
    (od.quantityOrdered - p.quantityInStock) AS quantitySold,
    od.priceEach,
    p.quantityInStock,
    (od.quantityOrdered - p.quantityInStock) * od.priceEach AS salesRevenue
FROM 
	products p
JOIN
	orderdetails od ON p.productCode = od.productCode
ORDER BY 
		salesRevenue DESC;
        
 -- Sorting by Quantity Sold
 SELECT 
	p.productCode,
    (od.quantityOrdered - p.quantityInStock) AS quantitySold,
    od.priceEach,
    p.quantityInStock,
    (od.quantityOrdered - p.quantityInStock) * od.priceEach AS salesRevenue
FROM 
	products p
JOIN
	orderdetails od ON p.productCode = od.productCode
ORDER BY 
	quantitySold DESC;
        
-- Analyzing Quantity in Stock
SELECT 
	p.productCode,
    (od.quantityOrdered - p.quantityInStock) AS quantitySold,
    p.quantityInStock,
    od.priceEach,
    (od.quantityOrdered - p.quantityInStock) * od.priceEach AS salesRevenue
FROM 
	products p
JOIN
	orderdetails od ON p.productCode = od.productCode
ORDER BY 
	quantityInStock DESC;
    
-- Calculating Profit Margin 
SELECT 
	p.productCode,
    (od.quantityOrdered - p.quantityInStock) AS quantitySold,
    p.quantityInStock,
    od.priceEach,
    (p.MSRP - buyPrice) AS profitMargin
FROM 
    products p
JOIN 
	orderdetails od ON p.productCode = od.productCode
ORDER BY
	profitMargin ASC;

--  ABC Analysis (Categorizing items based on their contribution to total revenue(cumulativePercentage)
WITH RevenueAnalysis AS (
	SELECT DISTINCT
	p.productCode,
	(od.quantityOrdered - p.QuantityInStock) * od.priceEach AS salesRevenue
	FROM
		products p
	JOIN 
		orderdetails od ON p.productCode = od.productCode 
    )
SELECT 
	productCode,
    MAX(salesRevenue) AS salesRevenue,
    MAX(salesRevenue) / SUM(MAX(salesRevenue)) OVER() * 100 AS
    percentageOfTotalRevenue,
		SUM(MAX(salesRevenue)) OVER (ORDER BY /
		MAX(salesRevenue) DESC) AS
        cumulativePercentage
FROM
	RevenueAnalysis
GROUP BY
	productCode
ORDER BY
	salesRevenue DESC;
 
 
 
 
 
 