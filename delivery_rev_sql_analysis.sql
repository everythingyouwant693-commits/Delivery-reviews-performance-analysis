
CREATE DATABASE IF NOT EXISTS fast_delivery_db;
select * from cleaned_fast_delivery_reviews;

-- 1. Objective: Benchmark platform performance across key operational metrics.
-- Task: Write a query to calculate total_orders, avg_customer_rating, avg_delivery_time_mins,
--  and avg_service_rating grouped by agent_name, sorted by highest customer rating.

select agent_name, count(*) as total_orders, round(avg(rating),2) as avg_customer_rating,
round(avg(delivery_time_min),2) as avg_delivery_time_mins, round(avg(customer_service_rating),2) as 
avg_service_rating from cleaned_fast_delivery_reviews group by agent_name order by avg_customer_rating desc;

-- 2. Objective: Calculate the operational error rate for each delivery platform.
-- Task: Write a query using CASE statements to find the percentage of incorrect order
--  deliveries and out-of-stock occurrences for each agent_name.
select agent_name, COUNT(*) AS total_orders, round(sum(case when product_availability =
 'Out Of Stock' then 1 else 0 end)*100/count(*),2) as 
 out_of_stock_occurrences, round(sum(case when order_accuracy = 'Incorrect' then 1 else 0 end)*100/
 count(*),2) as incorrect_order_deliveries from 
 cleaned_fast_delivery_reviews group by agent_name;
 
 
--  Objective 3: Analyze regional customer behavior to identify high-volume 
--  markets and discount penetration.Task: Write a query to count total_orders, 
--  count discounted_orders (where discount_applied = 'Yes'), and calculate the 
--  discount_percentage for each location, sorted by highest total orders.

select location, count(*) as total_orders, sum(case when discount_applied
 = 'Yes' then 1 else 0 end) as discounted_orders, round(sum(case when discount_applied
 = 'Yes' then 1 else 0 end)*100/count(*),2) as discount_percentage from 
 cleaned_fast_delivery_reviews group by location order by total_orders desc;
 
-- Business Question 4 (Window Functions & Ranking) Objective: Rank platforms
--  within each city based on their average customer rating.
select location,agent_name,  round(avg(rating),2) as avg_rating,
dense_rank() over (partition by location order by avg(rating) desc)
as platform_rnk from cleaned_fast_delivery_reviews GROUP BY 
location, agent_name ORDER BY location, platform_rnk;

-- Business Question 5 Objective: Identify platforms with a high rate of severe
--  delivery delay breaches (orders taking > 45 minutes) across locations.
WITH sla_analysis AS (SELECT location,agent_name,COUNT(*) AS total_orders,
SUM(CASE WHEN delivery_time_min > 45 THEN 1 ELSE 0 END) AS delayed_orders,
ROUND(SUM(CASE WHEN delivery_time_min > 45 THEN 1 ELSE 0 END) * 100.0 /
 COUNT(*), 2) AS sla_breach_pct FROM cleaned_fast_delivery_reviews GROUP BY 
location, agent_name)
SELECT location,agent_name,total_orders,delayed_orders,sla_breach_pct,
DENSE_RANK() OVER (PARTITION BY location ORDER BY sla_breach_pct DESC) 
AS breach_rank FROM sla_analysis ORDER BY location, breach_rank;

 
 
 





