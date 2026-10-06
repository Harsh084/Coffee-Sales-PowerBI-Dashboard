CREATE DATABASE Coffee_Sales_DB;
USE Coffee_Sales_DB;

CREATE TABLE Coffee_Sales (
    hour_of_day INT,
    cash_type VARCHAR(20),
    money DECIMAL(10,2),
    coffee_name VARCHAR(100),
    Time_of_Day VARCHAR(30),
    Weekday VARCHAR(20),
    Month_name VARCHAR(20),
    Weekdaysort INT,
    Monthsort INT,
    Sale_Date VARCHAR(20),
    Sale_Time VARCHAR(20),
    Coffee_type VARCHAR(100),
    Coffee_Images TEXT
);

SELECT * FROM coffee_sales
LIMIT 10;

#--- Checking Date Column ---#
SELECT Sale_Date 
FROM Coffee_Sales
LIMIT 10;
DESC Coffee_Sales;
#--- Create a proper DATE column ---#
ALTER TABLE coffee_sales
ADD COLUMN Sale_Date_New DATE;
#--- Converting the text date to DATE ---#
UPDATE coffee_sales
SET Sale_Date_New = 
			STR_TO_DATE(Sale_Date, '%d-%m-%Y');

SET SQL_SAFE_UPDATES = 0;

#--- Verify the conversion ---#
SELECT 
	Sale_Date,
    Sale_Date_New
FROM coffee_sales
LIMIT 20;

#--- Checking the conversion ---#
SELECT COUNT(*) AS Invalid_Dates
FROM coffee_sales
WHERE Sale_Date IS NOT NULL
AND Sale_Date_New IS NULL;

#--- Replacing the old text column ---#
ALTER TABLE coffee_sales
DROP COLUMN Sale_Date;
#-- Renaming the new column --#
ALTER TABLE Coffee_Sales
CHANGE Sale_Date_New Sale_Date DATE;
DESC Coffee_sales;

#--- Final Verify ---#
SELECT
    MIN(Sale_Date) AS Start_Date,
    MAX(Sale_Date) AS End_Date,
    COUNT(DISTINCT Sale_Date) AS Sales_Days
FROM Coffee_Sales;

#--- Basic data inspection ---#
SELECT *
FROM Coffee_Sales
LIMIT 10;

SELECT COUNT(*) AS Total_Transactions
FROM Coffee_Sales;

SELECT DISTINCT coffee_name
FROM Coffee_Sales;

#--- SQL EDA ---#
SELECT
    COUNT(*) AS Total_Rows,
    SUM(CASE WHEN money IS NULL THEN 1 ELSE 0 END) AS Missing_Money,
    SUM(CASE WHEN coffee_name IS NULL THEN 1 ELSE 0 END) AS Missing_Coffee,
    SUM(CASE WHEN Coffee_type IS NULL THEN 1 ELSE 0 END) AS Missing_Coffee_Type,
    SUM(CASE WHEN Coffee_Images IS NULL THEN 1 ELSE 0 END) AS Missing_Images
FROM Coffee_Sales;

#-- Duplicate Records --#
SELECT
    hour_of_day,
    cash_type,
    money,
    coffee_name,
    Time_of_Day,
    Weekday,
    Sale_Date,
    COUNT(*) AS Duplicate_Count
FROM Coffee_Sales
GROUP BY
    hour_of_day,
    cash_type,
    money,
    coffee_name,
    Time_of_Day,
    Weekday,
    Sale_Date
HAVING COUNT(*) > 1;

#-- Overall KPIs --#
SELECT 
	ROUND(SUM(money), 2) AS Total_Revenue
FROM Coffee_Sales;

SELECT 
	ROUND(AVG(money), 2) AS Average_Transaction_Value
FROM COffee_Sales;

SELECT
	ROUND(MIN(money), 2) AS Minimum_Sale,
    ROUND(MAX(money), 2) AS Maximum_Sale,
    ROUND(AVG(money), 2) AS Average_Sale
FROM Coffee_Sales;

#--- Coffee Performance ---#
SELECT 
	coffee_name,
    COUNT(*) AS Transactions,
    ROUND(SUM(money), 2) AS Revenue,
    ROUND(AVG(money), 2) AS Avg_Trasnaction
FROM Coffee_Sales
GROUP BY coffee_name
ORDER BY Revenue DESC;

#--- Top-selling coffee by quantity and transaction ---#
SELECT 
	coffee_name,
    COUNT(*) AS Total_Transactions
FROM coffee_sales
GROUP BY coffee_name
ORDER BY Total_Transactions DESC
LIMIT 5;

#--- Revenue Contribution ---#
SELECT 
	coffee_name,
    ROUND(SUM(money), 2) AS Revenue,
    ROUND(
		SUM(money) /
		(SELECT SUM(money) FROM Coffee_Sales) * 2
        ) AS Revenue_Percentage
FROM coffee_sales
GROUP BY coffee_name
ORDER BY Revenue DESC;

#--- Time of day analysis ---#
SELECT 
	Time_of_Day,
    COUNT(*) AS Transactions,
    ROUND(SUM(money), 2) AS Revenue,
	ROUND(AVG(money), 2) AS AVG_Transaction
FROM Coffee_Sales
GROUP BY Time_of_Day
ORDER BY Revenue DESC;

#--- Weekday analysis ---#
SELECT 
	Weekday,
    COUNT(*) AS Transactions,
    ROUND(SUM(money), 2) AS Revenue
FROM coffee_sales
GROUP BY weekday
ORDER BY Revenue DESC;

#--- Hourly analysis ---#
SELECT
	hour_of_day,
    COUNT(*) AS Transactions,
    ROUND(SUM(money), 2) AS Revenue
FROM coffee_sales
GROUP BY hour_of_day
ORDER BY Revenue DESC;

#--- Monthly analysis ---#
SELECT
    Monthsort,
    Month_name,
    COUNT(*) AS Transactions,
    ROUND(SUM(money), 2) AS Revenue
FROM Coffee_Sales
GROUP BY
    Monthsort,
    Month_name
ORDER BY Monthsort;

#--- Top 10 sales days ---#
SELECT
    Sale_Date,
    COUNT(*) AS Transactions,
    ROUND(SUM(money), 2) AS Revenue
FROM Coffee_Sales
GROUP BY Sale_Date
ORDER BY Revenue DESC
LIMIT 10;

#--- Product and time of day ---#
SELECT
    coffee_name,
    Time_of_Day,
    COUNT(*) AS Transactions,
    ROUND(SUM(money), 2) AS Revenue
FROM Coffee_Sales
GROUP BY
    coffee_name,
    Time_of_Day
ORDER BY Revenue DESC;

#--- Coffee and weekday ---#
SELECT
    coffee_name,
    Weekday,
    COUNT(*) AS Transactions,
    ROUND(SUM(money), 2) AS Revenue
FROM Coffee_Sales
GROUP BY
    coffee_name,
    Weekday
ORDER BY Revenue DESC;

#---Top 10 individual transaction ---#
SELECT
    Sale_Date,
    Sale_Time,
    coffee_name,
    money
FROM Coffee_Sales
ORDER BY money DESC
LIMIT 10;

#--- Payment analysis ---#
SELECT
    cash_type,
    COUNT(*) AS Transactions,
    ROUND(SUM(money), 2) AS Revenue
FROM Coffee_Sales
GROUP BY cash_type;
#------- For Exporting Dataset file -------#
SELECT * 
FROM Coffee_Sales;






















