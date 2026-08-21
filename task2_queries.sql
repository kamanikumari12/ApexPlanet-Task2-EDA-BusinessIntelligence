-- ====================================================================
-- TASK 2: EXPLORATORY DATA ANALYSIS (EDA) & BUSINESS INTELLIGENCE QUERIES
-- Dataset: ApexPlanet Data Analytics Dataset
-- ====================================================================

-- --------------------------------------------------------------------
-- QUERY 1: Top 5 Products by Revenue
-- Objective: Identify core revenue-generating products to optimize inventory.
-- --------------------------------------------------------------------
SELECT 
    Product, 
    SUM(Total_Sales) AS Total_Revenue,
    COUNT(Order_ID) AS Total_Orders,
    SUM(Quantity) AS Total_Units_Sold
FROM sales_data
GROUP BY Product
ORDER BY Total_Revenue DESC
LIMIT 5;


-- --------------------------------------------------------------------
-- QUERY 2: Monthly Revenue & Order Volume Trends
-- Objective: Analyze sales velocity across months to identify peak demand.
-- --------------------------------------------------------------------
SELECT 
    DATE_FORMAT(Order_Date, '%Y-%m') AS Sales_Month,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    SUM(Total_Sales) AS Total_Revenue,
    AVG(Total_Sales) AS Monthly_AOV
FROM sales_data
GROUP BY Sales_Month
ORDER BY Sales_Month ASC;


-- --------------------------------------------------------------------
-- QUERY 3: Revenue Segmentation by Category & Gender
-- Objective: Evaluate demographic customer preferences per category.
-- --------------------------------------------------------------------
SELECT 
    Category,
    Gender,
    COUNT(Order_ID) AS Total_Orders,
    SUM(Total_Sales) AS Total_Revenue,
    ROUND(AVG(Total_Sales), 2) AS Average_Order_Value
FROM sales_data
GROUP BY Category, Gender
ORDER BY Category ASC, Total_Revenue DESC;


-- --------------------------------------------------------------------
-- QUERY 4: Regional Market Demand & Average Order Value (AOV)
-- Objective: Assess performance across regional markets.
-- --------------------------------------------------------------------
SELECT 
    City,
    COUNT(Order_ID) AS Total_Orders,
    SUM(Total_Sales) AS Total_Revenue,
    ROUND(AVG(Total_Sales), 2) AS Average_Order_Value
FROM sales_data
WHERE City IS NOT NULL AND City != 'Unknown'
GROUP BY City
ORDER BY Total_Revenue DESC;


-- --------------------------------------------------------------------
-- QUERY 5: Customer Recency & Purchase Frequency Analysis
-- Objective: Rank top repeat customers by overall spending.
-- --------------------------------------------------------------------
SELECT 
    Customer_ID,
    COUNT(DISTINCT Order_ID) AS Order_Frequency,
    SUM(Total_Sales) AS Total_Customer_Spend,
    MAX(Order_Date) AS Last_Order_Date
FROM sales_data
GROUP BY Customer_ID
ORDER BY Total_Customer_Spend DESC
LIMIT 10;
