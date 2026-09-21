-- Supply Chain & Inventory Analytics
-- MySQL Analysis Script
-- Database: supply_chain_analytics
-- Table: supply_chain
-- Rows: 180,519

-- 1. DATABASE SETUP
DROP DATABASE IF EXISTS supply_chain_analytics;
CREATE DATABASE supply_chain_analytics;
USE supply_chain_analytics;

-- 2. DATA VALIDATION
SELECT COUNT(*) AS total_rows
FROM supply_chain;

SHOW WARNINGS LIMIT 10;

-- 3. KEY BUSINESS METRICS
SELECT ROUND(SUM(Sales), 2) AS total_sales
FROM supply_chain;

SELECT ROUND(SUM(`Order Profit Per Order`), 2) AS total_profit
FROM supply_chain;

SELECT COUNT(DISTINCT `Order Id`) AS total_orders
FROM supply_chain;

SELECT COUNT(DISTINCT `Customer Id`) AS total_customers
FROM supply_chain;

SELECT COUNT(DISTINCT `Product Name`) AS total_products
FROM supply_chain;

SELECT
    (SUM(`Order Profit Per Order`) / SUM(Sales)) * 100 AS profit_margin
FROM supply_chain;

SELECT AVG(`Shipping Delay`) AS average_shipping_delay
FROM supply_chain;

-- 4. DELIVERY ANALYSIS
SELECT
    `Delivery Status`,
    COUNT(*) AS total_records
FROM supply_chain
GROUP BY `Delivery Status`
ORDER BY total_records DESC;

SELECT
    `Delivery Status`,
    COUNT(*) AS total_records,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM supply_chain), 2) AS percentage
FROM supply_chain
GROUP BY `Delivery Status`
ORDER BY percentage DESC;

-- 5. SALES ANALYSIS
SELECT
    `Customer Segment`,
    ROUND(SUM(Sales), 2) AS total_sales
FROM supply_chain
GROUP BY `Customer Segment`
ORDER BY total_sales DESC;

SELECT
    `Market`,
    ROUND(SUM(Sales), 2) AS total_sales
FROM supply_chain
GROUP BY `Market`
ORDER BY total_sales DESC;

SELECT
    `Shipping Mode`,
    ROUND(SUM(Sales), 2) AS total_sales
FROM supply_chain
GROUP BY `Shipping Mode`
ORDER BY total_sales DESC;

SELECT
    `Category Name`,
    ROUND(SUM(Sales), 2) AS total_sales
FROM supply_chain
GROUP BY `Category Name`
ORDER BY total_sales DESC;

-- 6. PROFIT ANALYSIS
SELECT
    `Customer Segment`,
    ROUND(SUM(`Order Profit Per Order`), 2) AS total_profit
FROM supply_chain
GROUP BY `Customer Segment`
ORDER BY total_profit DESC;

SELECT
    `Shipping Mode`,
    ROUND(SUM(`Order Profit Per Order`), 2) AS total_profit
FROM supply_chain
GROUP BY `Shipping Mode`
ORDER BY total_profit DESC;

-- 7. TOP 10 ANALYSIS
SELECT
    `Product Name`,
    ROUND(SUM(Sales), 2) AS total_sales
FROM supply_chain
GROUP BY `Product Name`
ORDER BY total_sales DESC
LIMIT 10;

SELECT
    `Customer Id`,
    ROUND(SUM(Sales), 2) AS total_sales
FROM supply_chain
GROUP BY `Customer Id`
ORDER BY total_sales DESC
LIMIT 10;

-- 8. ORDER STATUS ANALYSIS
SELECT
    `Order Status`,
    ROUND(SUM(Sales), 2) AS total_sales
FROM supply_chain
GROUP BY `Order Status`
ORDER BY total_sales DESC;

-- 9. FINAL VALIDATION
SELECT COUNT(*) AS total_rows
FROM supply_chain;

SELECT ROUND(SUM(Sales), 2) AS total_sales
FROM supply_chain;

SELECT ROUND(SUM(`Order Profit Per Order`), 2) AS total_profit
FROM supply_chain;

-- Key validated values:
-- Total Rows: 180,519
-- Total Sales: 36,784,734.31
-- Total Profit: 3,966,902.97
-- Import warnings: 0

-- Note:
-- Delivery Status percentages are calculated at record/line-item level,
-- not unique-order level.
