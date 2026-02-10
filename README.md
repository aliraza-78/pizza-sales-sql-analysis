# Pizza Sales Analysis (MySQL)

This project is a simple SQL analysis of a pizza sales dataset using **MySQL**.  
I created this project to practice writing SQL queries, working with multiple tables, and answering real business-style questions using data.

---

## About the Data
The database contains four tables:
- `orders` – order date and time
- `order_details` – pizzas ordered and quantity
- `pizzas` – pizza size and price
- `pizza_types` – pizza name, category, and ingredients

These tables are connected using primary and foreign keys.

---

## What I Analyzed

### Basic
- Total number of orders
- Total revenue from pizza sales
- Highest priced pizza
- Most common pizza size
- Top 5 pizzas by quantity ordered

### Intermediate
- Total quantity ordered by pizza category
- Orders by hour of the day
- Category-wise pizza distribution
- Average pizzas ordered per day
- Top 3 pizzas by revenue

### Advanced
- Revenue contribution of each pizza type
- Cumulative revenue over time
- Top 3 pizzas by revenue within each category

---

## Skills Used
- MySQL
- SQL joins
- Aggregations (`SUM`, `COUNT`, `AVG`)
- Window functions
- Date and time analysis

---

## Project Structure
pizza-sales-sql-analysis
├── schema
│ └── database_schema.sql
├── queries
│ ├── basic_queries.sql
│ ├── intermediate_queries.sql
│ └── advanced_queries.sql
└── README.md


## What I Learned
- How to join multiple tables to answer business questions
- How to analyze sales and revenue using SQL
- How to write cleaner and more organized SQL queries

---

## Notes
This is a learning and portfolio project.  
The goal was to improve SQL skills and analytical thinking.
