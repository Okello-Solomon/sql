/* =========================================================
   DATABASE SETUP
========================================================= */
CREATE DATABASE Restaurant;
USE Restaurant;


/* =========================================================
   1. SALES PERFORMANCE ANALYSIS
========================================================= */

-- Computes total revenue by summing item prices from all orders, rounded to 2 decimal places.
SELECT 
    ROUND(SUM(m.price), 2) AS [Total Revenue]
FROM order_details od
JOIN menu_items m
    ON od.item_id = m.menu_item_id;

-- Category-wise sales performance showing total items sold and revenue contribution, ordered by revenue.
SELECT 
    m.category AS [Category],
    COUNT(*) AS [Total Items Sold],
    ROUND(SUM(m.price), 2) AS [Total Revenue]
FROM order_details od
JOIN menu_items m
    ON od.item_id = menu_item_id
GROUP BY m.category
ORDER BY [Total Revenue] DESC;

-- Calculates revenue and percentage contribution per category to total sales.
SELECT 
    m.category AS [Category],
    ROUND(SUM(m.price),2) AS [Revenue],
    ROUND(SUM(m.price) * 100.0 / SUM(SUM(m.price)) OVER (),2) AS [Revenue Share(%)]
FROM order_details od
JOIN menu_items m
    ON od.item_id = m.menu_item_id
GROUP BY m.category
ORDER BY [Revenue] DESC;


/* =========================================================
   2. ORDER ANALYSIS
========================================================= */

-- Counts total orders per menu item and category, sorted from highest to lowest.
SELECT 
    m.item_name AS [Item Name],
    m.category AS [Category],
    COUNT(*) AS [Total Orders]
FROM order_details od
JOIN menu_items m
    ON od.item_id = m.menu_item_id
GROUP BY m.item_name, m.category
ORDER BY [Total Orders] DESC;

-- Counts total orders per item and category, showing least ordered items first.
SELECT 
    m.item_name AS [Item Name],
    m.category AS [Category],
    COUNT(*) AS [Total Orders]
FROM order_details od
JOIN menu_items m
    ON od.item_id = m.menu_item_id
GROUP BY m.item_name, m.category
ORDER BY [Total Orders] ASC;

-- Computes total spending per order and ranks orders from highest to lowest value.
SELECT 
    od.order_id AS [Order id],
    ROUND(SUM(m.price),2) AS [Total Spent]
FROM order_details od
JOIN menu_items m
    ON od.item_id = m.menu_item_id
GROUP BY od.order_id
ORDER BY [Total Spent] DESC;

-- Calculates total spending per order and ranks orders from highest to lowest value.
SELECT 
    od.order_id AS [Order id],
    ROUND(SUM(m.price),2) AS [Total Spent]
FROM order_details od
JOIN menu_items m
    ON od.item_id = m.menu_item_id
GROUP BY od.order_id
ORDER BY [Total Spent] DESC;

-- Retrieves all items from the highest-revenue order and breaks down its contents by item, category, and price.
SELECT 
    od.order_id,
    m.item_name,
    m.category,
    m.price
FROM order_details od
JOIN menu_items m
    ON od.item_id = m.menu_item_id
WHERE od.order_id = (
    SELECT TOP 1 od2.order_id
    FROM order_details od2
    JOIN menu_items m2 
        ON od2.item_id = m2.menu_item_id
    GROUP BY od2.order_id
    ORDER BY SUM(m2.price) DESC
);


/* =========================================================
   3. TIME-BASED ANALYSIS
========================================================= */

-- Shows hourly order distribution and identifies peak ordering hours of the day.
SELECT 
    DATEPART(HOUR, order_time) AS [Hour of Day],
    COUNT(*) AS [Total Orders]
FROM order_details
GROUP BY DATEPART(HOUR, order_time)
ORDER BY [Total Orders] DESC;

-- Shows daily order counts based on unique order IDs.
SELECT 
    order_date AS [Order Date],
    COUNT(DISTINCT order_id) AS [Total Orders]
FROM order_details
GROUP BY order_date
ORDER BY [Order Date];

-- Orders grouped into peak periods
SELECT 
    CASE 
        WHEN DATEPART(HOUR, order_time) BETWEEN 11 AND 14 THEN 'Lunch Peak'
        WHEN DATEPART(HOUR, order_time) BETWEEN 18 AND 21 THEN 'Dinner Peak'
        ELSE 'Off Peak'
    END AS [Time Period],
    COUNT(DISTINCT order_id) AS [Total Orders]
FROM order_details
GROUP BY 
    CASE 
        WHEN DATEPART(HOUR, order_time) BETWEEN 11 AND 14 THEN 'Lunch Peak'
        WHEN DATEPART(HOUR, order_time) BETWEEN 18 AND 21 THEN 'Dinner Peak'
        ELSE 'Off Peak'
    END;


/* =========================================================
   4. PRODUCT PERFORMANCE ANALYSIS
========================================================= */

-- Shows the top 10 highest revenue-generating menu items with quantity sold and category breakdown.
SELECT TOP 10
    m.item_name AS [Item Name],
    m.category AS Category,
    COUNT(*) AS [Quantity Sold],
    ROUND(SUM(m.price),2) AS [Revenue]
FROM order_details od
JOIN menu_items m
    ON od.item_id = m.menu_item_id
GROUP BY m.item_name, m.category
ORDER BY  [Revenue] DESC;

-- Shows the 10 least sold menu items with their quantity sold and revenue contribution.
SELECT TOP 10
    m.item_name AS [Item Name],
    m.category AS Category,
    COUNT(*) AS [Quantity Sold],
    ROUND(SUM(m.price),2) AS [Revenue]
FROM order_details od
JOIN menu_items m
    ON od.item_id = m.menu_item_id
GROUP BY m.item_name, m.category
ORDER BY [Quantity Sold] ASC;


/* =========================================================
   5. KEY PERFORMANCE INDICATORS (KPIs)
========================================================= */

-- Counts the total number of items sold across all orders.
SELECT 
    COUNT(*) AS [Total Items Sold]
FROM order_details;

-- Calculates the average order value (total revenue divided by number of unique orders).
SELECT 
    ROUND(SUM(m.price) * 1.0 / COUNT(DISTINCT od.order_id),2) AS [Average Order Price]
FROM order_details od
JOIN menu_items m
    ON od.item_id = m.menu_item_id;