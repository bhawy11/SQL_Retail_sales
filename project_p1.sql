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
			   

SELECT * FROM retail_sales;
-- LIMIT 10;

SELECT COUNT(*) FROM retail_sales;

SELECT * FROM retail_sales
WHERE transactions_id IS NULL;

SELECT * FROM retail_sales
WHERE gender IS NULL;

SELECT * FROM retail_sales
WHERE
		transactions_id IS NULL
		OR
		sale_date IS null
		OR
		sale_time is null
		OR
		customer_id is null
		OR
		gender is null
		OR
		age is null
		OR
		category is null
		OR
		quantiy is null
		OR
		price_per_unit is null
		OR
		cogs is null
		OR
		total_sale IS NUll;


DELETE FROM retail_sales
WHERE
		transactions_id IS NULL
		OR
		sale_date IS null
		OR
		sale_time is null
		OR
		customer_id is null
		OR
		gender is null
		OR
		age is null
		OR
		category is null
		OR
		quantiy is null
		OR
		price_per_unit is null
		OR
		cogs is null
		OR
		total_sale IS NUll;

-- DATA EXPLORATION
-- How many sales we have?
SELECT count(*) as total_sales from retail_sales;

-- How many unique customers we have?
SELECT COUNT(DISTINCT customer_id) from retail_sales;


SELECT COUNT(DISTINCT category) from retail_sales;

-- DATA ANALYSIS
-- Q1. Write a SQL query to retrieve all columns for sales made on '2022-11-05'
SELECT *
FROM retail_sales
WHERE sale_date = '2022-11-05'

-- Q2. Write a SQL query to retreive all transactions where the category is 'Clothing' and the quantity sold is more
-- than 10 in the month of nov-2022
select *
from retail_sales
where category = 'Clothing'
and to_char (sale_date, 'YYYY-MM') = '2022-11'
and quantiy >=4

-- Q3. Write a SQL query to calculate the total sales (total_sale) for each category.
select category, sum(total_sale) as net_sale, count(*) as total_orders
from retail_sales
group by 1

-- Q4. write a sql query to find the average age of customers who purchased items from the 'Beauty' category
select round(avg(age), 2) as avg_age
from retail_sales
where category = 'Beauty'

-- Q5. Write a Sql query to find all transactions where the total_sale is greater than 1000.
select * from retail_sales;

SELECT * FROM retail_sales
WHERE total_sale > 1000;


-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
SELECT 
    category,
    gender,
    COUNT(*) as total_trans
FROM retail_sales
GROUP 
    BY 
    category,
    gender
ORDER BY 1;

-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year

SELECT 
       year,
       month,
    avg_sale
FROM 
(    
SELECT 
    EXTRACT(YEAR FROM sale_date) as year,
    EXTRACT(MONTH FROM sale_date) as month,
    AVG(total_sale) as avg_sale,
    RANK() OVER(PARTITION BY EXTRACT(YEAR FROM sale_date) ORDER BY AVG(total_sale) DESC) as rank
FROM retail_sales
GROUP BY 1, 2
) as t1
WHERE rank = 1
ORDER BY 1, 3 DESC;

-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
SELECT 
    customer_id,
    SUM(total_sale) as total_sales
FROM retail_sales
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;

-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
select * from retail_sales;

select category, count(distinct customer_id) as unique_customer
from retail_sales
group by category

-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17)
WITH hourly_sale
AS
(
SELECT *,
    CASE
        WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END as shift
FROM retail_sales
)
SELECT 
    shift,
    COUNT(*) as total_orders    
FROM hourly_sale
GROUP BY shift
