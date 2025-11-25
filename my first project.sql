--Question 1

SELECT
    *
FROM
    `retail-sales-478118.sales.sales`
WHERE
    EXTRACT(YEAR FROM date) = 2023
LIMIT 1000;

--Question 2

SELECT
    *
FROM
    `retail-sales-478118.sales.sales`
WHERE
    `total amount` > (
        SELECT
            AVG(`total amount`)
        FROM
            `retail-sales-478118.sales.sales`
    );

--Question 3

SELECT 
  SUM(`total amount`) AS Total_Revenue
FROM `retail-sales-478118.sales.sales`;


--Question 4

SELECT DISTINCT
    `product category` AS Product_Category 
FROM
    `retail-sales-478118.sales.sales`;


--Question 5

SELECT
  'product category' AS Product_Category,
  SUM(quantity) AS Total_Quantity
FROM `retail-sales-478118.sales.sales`
GROUP BY product_category
ORDER BY Total_Quantity DESC;  


--Question 6

  SELECT
  'customer id' AS Customer_ID,
  age AS Age,
  CASE
    WHEN age < 30 THEN 'Youth'
    WHEN age BETWEEN 30 AND 59 THEN 'Adult'
    WHEN age >= 60 THEN 'Senior'
  END AS Age_Group
FROM `retail-sales-478118.sales.sales`;


--Question 7

 SELECT
    gender AS Gender,
    COUNT(*) AS High_Value_Transactions
FROM
    `retail-sales-478118.sales.sales`
WHERE
    `total amount` > 500 
GROUP BY
    gender;


--Question 8

SELECT
    `product category` AS Product_Category, 
    SUM(`total amount`) AS Total_Revenue     
FROM
    `retail-sales-478118.sales.sales`       
GROUP BY
    Product_Category                        
HAVING
    SUM(`total amount`) > 5000;      


--Question 9

SELECT
    `transaction id` AS Transaction_ID,
    `price per unit` AS Price_per_Unit,
    CASE
        WHEN `price per unit` < 50 THEN 'Cheap'
        WHEN `price per unit` BETWEEN 50 AND 200 THEN 'Moderate'
        WHEN `price per unit` > 200 THEN 'Expensive'
        ELSE 'Unknown' -- Good practice to handle any unexpected NULL or zero values
    END AS Unit_Cost_Category
FROM
    `retail-sales-478118.sales.sales`;   


--Question 10

SELECT
    `customer id` AS Customer_ID,
    age AS Age,
    `total amount` AS Total_Amount,
    CASE
        WHEN `total amount` > 1000 THEN 'High'
        ELSE 'Low'
    END AS Spending_Level
FROM
    `retail-sales-478118.sales.sales`
WHERE
    age >= 40;


--Question 10


