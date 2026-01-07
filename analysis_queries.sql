/* =========================================
   SALES DATABASE ANALYSIS USING SQL
   ========================================= */

-- 1. Total revenue by region
SELECT
    c.region,
    SUM(od.revenue) AS total_revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_details od ON o.order_id = od.order_id
GROUP BY c.region
ORDER BY total_revenue DESC;

-- 2. Monthly sales trend
SELECT
    DATE_TRUNC('month', o.order_date) AS sales_month,
    SUM(od.revenue) AS total_revenue
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
GROUP BY sales_month
ORDER BY sales_month;

-- 3. Top 5 products by revenue
SELECT
    p.product_name,
    SUM(od.revenue) AS total_revenue
FROM products p
JOIN order_details od ON p.product_id = od.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC
LIMIT 5;

-- 4. Revenue per customer
SELECT
    c.customer_name,
    SUM(od.revenue) AS total_revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_details od ON o.order_id = od.order_id
GROUP BY c.customer_name
ORDER BY total_revenue DESC;

-- 5. Average order value
SELECT
    AVG(order_total) AS average_order_value
FROM (
    SELECT
        o.order_id,
        SUM(od.revenue) AS order_total
    FROM orders o
    JOIN order_details od ON o.order_id = od.order_id
    GROUP BY o.order_id
) sub;
