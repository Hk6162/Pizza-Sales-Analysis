select * from pizza_sales_updated;

-- TOTAL REVENUE
select format(round(SUM(total_price)), 0) as Total_Revenue 
from pizza_sales_updated;

-- AVERAGE ORDER VALUE
select round(sum(total_price)/count(distinct order_id),2) as Average_Order_Value 
from pizza_sales_updated;

-- TOTAL PIZZAS SOLD
select format(sum(quantity), 0) as Total_Pizzas_Sold 
from pizza_sales_updated;

-- TOTAL ORDERS
select format(count(distinct order_id), 0) as Total_Orders 
from pizza_sales_updated;

-- AVERAGE PIZZAS PER ORDER
select round((sum(quantity) / count(distinct order_id)), 2) as Average_Pizzas_Per_Order
from pizza_sales_updated;

-- ORDERS BY DAY OF WEEK
select dayname(order_date) as Day, count(distinct order_id) as Orders 
from pizza_sales_updated 
group by dayname(order_date);

-- ORDERS BY MONTHS
select monthname(order_date) as Month, count(distinct order_id) as Orders 
from pizza_sales_updated 
group by monthname(order_date);

-- REVENUE PERCENTAGE BY PIZZA CATEGORY
select pizza_category, round(sum(total_price)/(select sum(total_price) from pizza_sales_updated)*100,2) as percentage_revenue
from pizza_sales_updated
group by pizza_category;

-- REVENUE BY PIZZA SIZE
select 
	pizza_size, 
    format(round(sum(total_price)), 0) as revenue, 
    round(sum(total_price)/(select sum(total_price) from pizza_sales_updated)*100,2) as percentage_revenue
from pizza_sales_updated
group by pizza_size
order by 2 desc;

-- TOTAL PIZZAS SOLD BY PIZZA CATEGORY
select 
	pizza_category, 
    format(round(sum(quantity)), 0) as Pizzas_Sold
from pizza_sales_updated
group by pizza_category
order by 2 desc;

-- TOP 5 PIZZAS BY REVENUE
select pizza_name, format(round(sum(total_price)), 0) as Revenue 
from pizza_sales_updated 
group by 1 
order by 2 desc
limit 5;

-- BOTTOM 5 PIZZAS BY REVENUE
select pizza_name, format(round(sum(total_price)), 0) as Revenue 
from pizza_sales_updated 
group by 1 
order by 2 
limit 5;

-- TOP 5 PIZZAS BY QUANTITY
select pizza_name, sum(quantity) as Quantity 
from pizza_sales_updated 
group by 1 
order by 2 desc
limit 5;

-- BOTTOM 5 PIZZAS BY QUANTITY
select pizza_name, sum(quantity) as Quantity 
from pizza_sales_updated 
group by 1 
order by 2 
limit 5;

-- BOTTOM 5 PIZZAS BY TOTAL ORDERS
select pizza_name, count(distinct order_id) as Orders 
from pizza_sales_updated 
group by 1 
order by 2 desc
limit 5;

-- BOTTOM 5 PIZZAS BY TOTAL ORDERS
select pizza_name, count(distinct order_id) as Orders 
from pizza_sales_updated 
group by 1 
order by 2 
limit 5;

