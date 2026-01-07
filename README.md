# Sales Database Analysis (SQL)

## Project Overview
This project demonstrates the use of SQL to analyze sales data stored in a relational database. 
The analysis focuses on revenue trends, product performance, customer behavior, and regional sales insights 
to support business reporting and decision-making.

## Database Structure
The database consists of the following tables:

- customers (customer_id, customer_name, region)
- products (product_id, product_name, category)
- orders (order_id, customer_id, order_date)
- order_details (order_id, product_id, quantity, revenue)

## Key Business Questions Answered
- Which regions generate the highest revenue?
- What are the monthly sales trends?
- Which products contribute the most to total revenue?
- How much revenue does each customer generate?
- What is the average order value?

## Skills Demonstrated
- SQL joins (INNER JOIN)
- Aggregations (SUM, AVG, COUNT)
- Grouping and filtering
- Subqueries
- Business-focused data analysis

## Files in This Repository
- schema.sql – Database table creation scripts
- analysis_queries.sql – SQL queries used for analysis
