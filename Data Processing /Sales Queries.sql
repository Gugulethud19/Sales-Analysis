
--Explore dataset
SELECT *
FROM sales.public.sales;


--Daily Sales per unit 
SELECT 
  Date,
  Sales / Quantity_Sold AS Sales_Price_Per_Unit
FROM sales;

--Average unit sales prices
SELECT 
  SUM(Sales) / SUM(Quantity_Sold) AS Avg_Unit_Sales_Price
FROM sales;

--Daily Gross Profit
SELECT 
  Date,
  ((Sales - Cost_of_Sales) / Sales) * 100 AS Gross_Profit_Percent
FROM sales;

--Daily Gross Profit per unit
SELECT 
  Date,
  ((Sales / Quantity_Sold - Cost_of_Sales / Quantity_Sold) / (Sales / Quantity_Sold)) * 100 AS Gross_Profit_Per_Unit_Percent
FROM sales;


--Price Elasticity of demand
SELECT 
  Date,
  Sales / Quantity_Sold AS Unit_Price,
  Quantity_Sold
FROM sales;

--Total Gross Trend
SELECT 
  Date,
  Sales - Cost_of_Sales AS Gross_Profit
FROM sales;

--Best and Worst performing days by profit
    --Best days
    SELECT 
  Date,
  Sales - Cost_of_Sales AS Gross_Profit
FROM sales
ORDER BY Gross_Profit DESC
LIMIT 1;

    --Worst day
    SELECT 
  Date,
  Sales - Cost_of_Sales AS Gross_Profit
FROM sales
ORDER BY Gross_Profit ASC
LIMIT 1;


--transformed dataset
SELECT  
    Date,
    Sales,
    Cost_of_Sales,
    Quantity_Sold,
    ROUND(Sales / NULLIF(Quantity_Sold, 0), 2) AS Unit_Price,
    ROUND(Cost_of_Sales / NULLIF(Quantity_Sold, 0), 2) AS Cost_Per_Unit,
    ROUND(((Sales - Cost_of_Sales) / NULLIF(Sales, 0)) * 100, 2) AS Gross_Profit_Percent,
    ROUND(((Sales / NULLIF(Quantity_Sold, 0)) - (Cost_of_Sales / NULLIF(Quantity_Sold, 0))) 
          / NULLIF((Sales / NULLIF(Quantity_Sold, 0)), 0) * 100, 2) AS Gross_Profit_Per_Unit_Percent
FROM sales
ORDER BY Date;
