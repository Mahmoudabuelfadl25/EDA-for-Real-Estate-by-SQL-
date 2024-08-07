
-- Dataset Exploration

SELECT   *
FROM [myDB].[dbo].[Real_Estate]
-- Dataset form from 997,217 rows and 11 columns 


-- To Get Number of rows 
SELECT count(*) AS 'Number of Rows'
FROM [myDB].[dbo].[Real_Estate]



--Dataset Timeline: What range of years does the dataset encompass?

SELECT MIN(List_Year) AS FirstDate
FROM [myDB].[dbo].[Real_Estate];

SELECT MAX(List_Year) AS LastDate
FROM [myDB].[dbo].[Real_Estate]

-- The date of dataset is from 2001 to 2020


-- Peak Sales Years: In which years were the highest number of units sold?

SELECT List_Year, COUNT(*) AS Total_Number
FROM [myDB].[dbo].[Real_Estate]
GROUP BY List_Year
ORDER BY List_Year
-- 


--Top Sales Months: Which months consistently show the highest units sold?

SELECT MONTH(Date_recorded) AS Month, COUNT(*) AS Total_Number
FROM [myDB].[dbo].[Real_Estate]
GROUP BY MONTH(Date_recorded)
ORDER BY Total_Number DESC


-- Geographic Distribution: What are the towns represented in the dataset?

Select Town, COUNT(*) AS Total_Number
FROM [myDB].[dbo].[Real_Estate]
GROUP BY Town
ORDER BY Total_Number DESC


-- Maximum Assessed Value
SELECT MAX([Assessed_Value]) AS MaxAssessedValue
FROM [myDB].[dbo].[Real_Estate];

-- Minimum Assessed Value
SELECT MIN([Assessed_Value]) AS MinAssessedValue
FROM [myDB].[dbo].[Real_Estate];

-- Average Assessed Value
SELECT AVG([Assessed_Value]) AS AvgAssessedValue
FROM [myDB].[dbo].[Real_Estate];



-- Maximum Sale Amount
SELECT MAX([Sale_Amount]) AS MaxSaleAmount
FROM [myDB].[dbo].[Real_Estate];

-- Minimum Sale Amount
SELECT MIN([Sale_Amount]) AS MinSaleAmount
FROM [myDB].[dbo].[Real_Estate];

-- Average Sale Amount
SELECT AVG([Sale_Amount]) AS AvgSaleAmount
FROM [myDB].[dbo].[Real_Estate];


-- Maximum, Minimum and average  Sales_ratio
SELECT MAX(Sales_ratio) As Max_Sales_ratio
FROM [myDB].[dbo].[Real_Estate] 

SELECT MIN(Sales_ratio)  As Min_Sales_ratio
FROM [myDB].[dbo].[Real_Estate]

SELECT AVG(Sales_ratio)  As AVG_Sales_ratio
FROM [myDB].[dbo].[Real_Estate]


-- Sales Ratio Analysis: In which locations are the highest and lowest sales ratios observed?
SELECT Town, MAX(Sales_Ratio) AS Highest_Sales_Ratio
FROM [myDB].[dbo].[Real_Estate]
GROUP BY Town
ORDER BY Highest_Sales_Ratio Desc


-- Which Property Type have higher sales volumes?

SELECT Property_Type, COUNT(*) AS Sales_Volume
FROM [myDB].[dbo].[Real_Estate]
GROUP BY Property_Type
ORDER BY Sales_Volume DESC;



-- Finding the town with the highest number of properties sold and the total sales amount for that town:

WITH TownSales AS (
    SELECT TOP 10 Town, COUNT(*) AS Number_of_Properties_Sold, SUM(Sale_Amount) AS Total_Sales_Amount
    FROM [myDB].[dbo].[Real_Estate]
    GROUP BY Town
)
SELECT Town, Number_of_Properties_Sold, Total_Sales_Amount
FROM TownSales
ORDER BY Number_of_Properties_Sold DESC


--Finding the top 5 towns with the highest sales ratio for commercial properties, including the number of properties sold:

SELECT TOP 5 Town, COUNT(*) AS Number_of_Properties_Sold
FROM [myDB].[dbo].[Real_Estate]
WHERE Property_Type = 'Commercial'
GROUP BY Town
ORDER BY  Number_of_Properties_Sold DESC;


--Identifying properties sold within a specific date range and calculating the total sales amount for each property type:

SELECT Property_Type, SUM(Sale_Amount) AS Total_Sales_Amount
FROM [myDB].[dbo].[Real_Estate]
WHERE Date_Recorded BETWEEN '2020-01-01' AND '2022-12-31'
GROUP BY Property_Type
ORDER BY Total_Sales_Amount DESC

-- Finding the top 5 towns with the highest average sale amount for residential properties:

SELECT TOP 5 Town, AVG(Sale_Amount) AS Average_Sale_Amount
FROM [myDB].[dbo].[Real_Estate]
WHERE Property_Type = 'Residential'
GROUP BY Town
ORDER BY Average_Sale_Amount DESC;


-