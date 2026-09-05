# SQL_Retail_sales Analysis


It is designed to demonstrate SQL skills and techniques typically used by data analysts to explore, clean, and analyze retail sales data. The project involves setting up a retail sales database, performing exploratory data analysis (EDA), and answering specific business questions through SQL queries. This project is ideal for those who are starting their journey in data analysis and want to build a solid foundation in SQL.

## Objectives
Set up a retail sales database: Create and populate a retail sales database with the provided sales data.
Data Cleaning: Identify and remove any records with missing or null values.
Exploratory Data Analysis (EDA): Perform basic exploratory data analysis to understand the dataset.
Business Analysis: Use SQL to answer specific business questions and derive insights from the sales data.

## Project Structure
### 1. Database Setup
Database Creation: The project starts by creating a database named p1_retail_db.
Table Creation: A table named retail_sales is created to store the sales data. The table structure includes columns for transaction ID, sale date, sale time, customer ID, gender, age, product category, quantity sold, price per unit, cost of goods sold (COGS), and total sale amount.

```sql
create table retail_sales(
                transactions_id int PRIMARY key,
                sale_date DATE,
                sale_time TIME,
                customer_id INT,
                gender VARCHAR(15),
                age INT,
                category VARCHAR(15),
                quantiy INT,
                price_per_unit FLOAT,
                cogs FLOAT,
                total_sale FLOAT
               );
```

### 2. Data Exploration & Cleaning
Record Count: Determine the total number of records in the dataset.
Customer Count: Find out how many unique customers are in the dataset.
Category Count: Identify all unique product categories in the dataset.
Null Value Check: Check for any null values in the dataset and delete records with missing data.
```sql
SELECT COUNT(*) FROM retail_sales;
SELECT COUNT(DISTINCT customer_id) FROM retail_sales;
SELECT DISTINCT category FROM retail_sales;

SELECT * FROM retail_sales
WHERE 
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;

DELETE FROM retail_sales
WHERE 
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;
```
### Key Insights

* **Customer Demographics:** The dataset covers customers from a wide range of age groups, with purchasing activity primarily concentrated in categories such as Clothing and Beauty.

* **High-Value Transactions:** A significant number of transactions exceeded 1,000 in total sales, highlighting the presence of premium and high-value purchases.

* **Sales Trends:** Monthly sales analysis reveals fluctuations in revenue throughout the year, helping identify periods of higher and lower sales performance.

* **Customer Insights:** The analysis highlights the highest-spending customers and identifies the most frequently purchased product categories, providing valuable insights into customer preferences and purchasing behavior.

### Reports
* **Sales Summary:** Provides an overview of total sales, customer demographics, and category-wise performance.
* **Sales Trend Analysis:** Analyzes sales patterns across different months and time periods to identify changes in performance.
* **Customer Insights:** Highlights top-spending customers, customer distribution, and unique customer counts across different product categories.
* **Category Performance:** Examines the performance of each product category to identify the most popular and highest-performing categories.

### Conclusion
This project serves as a comprehensive introduction to SQL for data analysts, covering database setup, data cleaning, exploratory data analysis, and business-driven SQL queries. The findings from this project can help drive business decisions by understanding sales patterns, customer behavior, and product performance.

### How to Use
* **Clone the Repository:** Clone this project repository from GitHub.
* **Set Up the Database:** Run the SQL scripts provided in the database_setup.sql file to create and populate the database.
* **Run the Queries:** Use the SQL queries provided in the analysis_queries.sql file to perform your analysis.
* **Explore and Modify:** Feel free to modify the queries to explore different aspects of the dataset or answer additional business questions.
