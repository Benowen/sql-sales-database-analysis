# Sales Database Analysis (SQL)

## Project Overview
This project demonstrates how SQL can be used to analyze sales data stored in a relational database.
The analysis focuses on identifying revenue trends, understanding customer behavior, evaluating product performance,
and supporting business reporting and decision-making.

## Business Questions Answered
- Which regions generate the highest revenue?
- How does sales performance change over time?
- Which products contribute the most to revenue?
- How much revenue does each customer generate?
- What is the average order value?

## Database Design
The database follows a normalized relational structure and consists of:
- customers
- products
- orders
- order_details

Primary and foreign keys are used to enforce relationships between tables.

## Key SQL Techniques Used
- Multi-table joins
- Aggregations (SUM, AVG, COUNT)
- Grouping and sorting
- Subqueries
- Business-focused query logic
- Common Table Expressions (CTEs)
- Window functions (RANK, LAG, running totals)


## Files in This Repository
- schema.sql – Database table creation scripts
- analysis_queries.sql – SQL queries used to answer business questions

## Use Case
The queries in this repository can support:
- Sales performance reporting
- Management dashboards
- Business intelligence analysis
