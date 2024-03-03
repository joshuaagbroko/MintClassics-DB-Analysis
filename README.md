# Mintclassics DB Analysis Overview 
Mint Classics Company is hoping to close one of their storage facilities. They want suggestions and recommendations for reorganizing or reducing inventory, while still maintaining timely service to their customers.

## Contents 
- Introduction
- Project scenario
- Project Challenge
-  

Entry-level data analyst at the fictional Mint Classics Company, helping to analyze data in a relational database with the goal of supporting inventory-related business decisions that lead to the closure of a storage facility.

Project Scenario

Mint Classics Company, a retailer of classic model cars and other vehicles, is looking at closing one of their storage facilities. 

To support a data-based business decision, they are looking for suggestions and recommendations for reorganizing or reducing inventory, while still maintaining timely service to their customers. For example, they would like to be able to ship a product to a customer within 24 hours of the order being placed.

As a data analyst, you have been asked to use MySQL Workbench to familiarize yourself with the general business by examining the current data. You will be provided with a data model and sample data tables to review. You will then need to isolate and identify those parts of the data that could be useful in deciding how to reduce inventory. You will write queries to answer questions like these:

1) Where are items stored and if they were rearranged, could a warehouse be eliminated?

2) How are inventory numbers related to sales figures? Do the inventory counts seem appropriate for each item?

3) Are we storing items that are not moving? Are any items candidates for being dropped from the product line?


## Project  Challenge

Your challenge will be to conduct an exploratory data analysis to investigate if there are any patterns or themes that may influence the reduction or reorganization of inventory in the Mint Classics storage facilities. To do this, you will import the database and then analyze data. You will also pose questions, and seek to answer them meaningfully using SQL queries to retrieve data from the database provided.

Conduct a product analysis to identify items in storage with low movement.

Identify products in the processing stage to prioritize shipment before deciding on warehouse closure.


## Data

In this section, I will present the database structure of Mint Classics Company through an EER (Extended Entity-Relationship) Diagram.



In the uploaded diagram, the database consists of 9 tables,

Products table: This table consists of the product types, Order quantities, Pices, product description and so on.
Product Lines: Gather information regarding the descriptions of every product line offered for sale by the company.
Customers: It gathers information on the company customers profile such as names, address, credit limit and so on.
Payments: This table consists of payments made by customers
Warehouse: It include the company warehouses used to store the products
Orders: it consists of customers orders for specific products
Order Details: It gathers data about others for specific products.
Office: It includes data on the different branches and the location.
Employees: It gathers data on the company employees which include; names, address, offices and so on

After studying the EER diagram, th following tables are used to solve the business problem:

- warehouses
- products
- productlines
- orders
- orderdetails


# Analysis 

- Warehouses South and North are operating at high capacities, indicating a need for inventory management strategies to optimize space utilization or consider expansion.

- Warehouse East has the highest total quantity ordered and total quantity in stock, suggesting that it may benefit from reevaluation of stock levels and inventory distribution to ensure efficient operations.

- Warehouse West has the lowest usage percentage and total quantity ordered, indicating potential opportunities for reallocating inventory from other warehouses or reassessing its role in the supply chain.

- The East, North and South generated more revenue than the west warehouse.

# Summary 

In my overall assessment, it appears reasonable to consider closing the West warehouse. However, I acknowledge that this analysis may not be exhaustive, and there are additional factors that I believe should be taken into consideration before making a final decision.
