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


/* =========================================
   ADVANCED SQL ANALYSIS
   Using CTEs and Window Functions
   ========================================= */

-- 6. Monthly revenue with running total (Window Function)
SELECT
    sales_month,
    monthly_revenue,
    SUM(monthly_revenue) OVER (ORDER BY sales_month) AS running_total_revenue
FROM (
    SELECT
        DATE_TRUNC('month', o.order_date) AS sales_month,
        SUM(od.revenue) AS monthly_revenue
    FROM orders o
    JOIN order_details od ON o.order_id = od.order_id
    GROUP BY sales_month
) sub
ORDER BY sales_month;

-- 7. Rank products by revenue within each category (Window Function)
SELECT
    p.category,
    p.product_name,
    SUM(od.revenue) AS total_revenue,
    RANK() OVER (
        PARTITION BY p.category
        ORDER BY SUM(od.revenue) DESC
    ) AS revenue_rank
FROM products p
JOIN order_details od ON p.product_id = od.product_id
GROUP BY p.category, p.product_name;

-- 8. Top-performing customers using CTE
WITH customer_revenue AS (
    SELECT
        c.customer_id,
        c.customer_name,
        SUM(od.revenue) AS total_revenue
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_details od ON o.order_id = od.order_id
    GROUP BY c.customer_id, c.customer_name
)
SELECT
    customer_name,
    total_revenue
FROM customer_revenue
ORDER BY total_revenue DESC
LIMIT 10;

-- 9. Month-over-month revenue growth (CTE + Window Function)
WITH monthly_sales AS (
    SELECT
        DATE_TRUNC('month', o.order_date) AS sales_month,
        SUM(od.revenue) AS monthly_revenue
    FROM orders o
    JOIN order_details od ON o.order_id = od.order_id
    GROUP BY sales_month
)
SELECT
    sales_month,
    monthly_revenue,
    LAG(monthly_revenue) OVER (ORDER BY sales_month) AS previous_month_revenue,
    (monthly_revenue - LAG(monthly_revenue) OVER (ORDER BY sales_month)) AS revenue_change
FROM monthly_sales
ORDER BY sales_month;
