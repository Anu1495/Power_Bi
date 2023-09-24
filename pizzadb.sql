select Round(sum(total_price),2) Total_Revenue from pizza_sales
select * from pizza_sales
select sum(total_price)/count(distinct order_id) from pizza_sales
select count(distinct order_id) from pizza_sales
select cast(cast(sum(quantity) as decimal (10,2))/count( distinct order_id) as decimal (10,2)) from pizza_sales
select datename(month, order_date) as Order_month, count (distinct order_id) total_orders
from pizza_sales
group by datename(month, order_date)
order by total_orders desc
percentage of sales by pizza category
select * from [pizza db].[dbo].[pizza_sales]
select pizza_category, sum(total_price),round(sum(total_price)*100/(select sum(total_price) from pizza_sales where month(order_date)=3),2)
from pizza_sales
where month(order_date)=3
group by pizza_category
select pizza_size, sum(total_price), sum(total_price)*100/(select sum(total_price) from pizza_sales)
from pizza_sales
where datepart(quarter,order_date)=3
group by pizza_size
select top 5 pizza_name, sum(quantity) as Quantity
from pizza_sales
group by pizza_name
order by quantity desc
select top 5 pizza_name, sum(total_price) as price
from pizza_sales
group by pizza_name
order by price desc
select top 5 pizza_name, count(distinct order_id) as Orders
from pizza_sales
group by pizza_name
order by orders desc