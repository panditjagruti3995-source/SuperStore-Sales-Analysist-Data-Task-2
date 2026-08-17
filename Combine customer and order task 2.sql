CREATE DATABASE superstore_new;
USE superstore_new;
SELECT DATABASE();
SELECT *
FROM customers
LIMIT 10;
SELECT
    o.`Order ID`,
    o.`Order Date`,
    c.`Customer Name`,
    c.`Region`,
    o.`Product Category`,
    o.`Sales`,
    o.`Profit`
FROM orders o
INNER JOIN customers c
    ON o.`Customer ID` = c.`Customer ID`;
Query 1: Total sales by region
select c.`Region`,
       Sum(o.sales) As `Total sales`
From Orders o
Join Customers c
ON o.`Customer ID` = c.`Customer ID`
Group by c.`Region`;
query 2: Profit Margin by Category
Select `Product Category`,
	    SUM(Profit)/SUM(sales) As `Profit Margin`
From Orders
Group by `Product Category`;
Select 
     Month(`Order Date`) As `Month`,
     sum(sales) As `Monthly sales`
from Orders
Group by Month(`Order Date`)
Order by Month(`Order Date`);
Query 4 : Top 5 customers by Revenue
Select
      c.`Customer Name`,
      sum(o.sales) As `Total Revenue`
From Orders o
Join Customers c
On o.`Customer ID`= c.`Customer ID`
Group by c.`Customer Name`
Order by `Total Revenue` DESC
Limit 5;