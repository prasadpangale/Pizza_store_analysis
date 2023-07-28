select * from pizza_sales1
select sum(quantity) from pizza_sales1
select pizza_size,count(*) as counts from pizza_sales1 group by pizza_size order by counts desc



1)Total Revenue

select sum(total_price) as Total_revenue from pizza_sales1

select * from pizza_sales1


2)Average order value

select sum(total_price)/count(distinct order_id) as Avg_order_value from pizza_sales1 


3)total pizzas sold

select sum(quantity) as Total_Pizzas from pizza_sales1


4)Total no. of orders

select * from pizza_sales1

select count(distinct order_id) as Total_orders from pizza_sales1


5) average pizzas per order
select cast (sum(quantity)as decimal(10,2))/cast(count(distinct order_id)as decimal(10,2)) as avg_pizzas_per_order from pizza_sales1



6) pizza category ranking as per size 

select *,rank() over (partition by pizza_size order by counts Desc) as ranking from
(
select pizza_size,pizza_category,count(pizza_size) as counts from pizza_sales1 group by pizza_category,pizza_size
)a



7)orders as per month

select months,count(order_id) as orders from
(
select order_id ,datename(month,order_date) as months from pizza_sales1 
)a
group by months order by orders DESC


8)orders as per day

select day,count(distinct order_id) as As_per_day from 
(
select order_id ,datename(WEEKDAY,order_date) as Day from pizza_sales1 
)a
group by day order by as_per_day DESC


9)% sales contribution as per  categoryy

select pizza_category,sum(total_price)/(select sum(total_price) from pizza_sales1)*100 as Percentage_contribution from pizza_sales1 
where month(order_date)=1
group by pizza_category


10)% sales contribution as per  categoryy for first month

select pizza_category,sum(total_price)/(select sum(total_price) from pizza_sales1)*100 as Percentage_contribution from pizza_sales1 
where month(order_date)=1
group by pizza_category

11) % sales contribution as per pizza size

select * from pizza_sales1 

select pizza_size,sum(total_price) /(select sum(total_price) from pizza_sales1)*100  as Sales_contribution 
from pizza_sales1 group by pizza_size
 

12) pizza sold as per category

 select * from pizza_sales1 

 select pizza_category,sum(quantity) as quantity from pizza_sales1 
 group  by pizza_category order by quantity DESC



13) top 5 pizzas as per revenue

 select top 5 pizza_name as Top_5_pizzas,sum(total_price) as Revenue from pizza_sales1 group by pizza_name order by revenue DESc

  select * from pizza_sales1 

14) Order counts as per hour 

select Time_interval,count(time_interval) as orders_as_per_hour from 
(
select *,concat (datepart(hour,order_time),'-',datepart(hour,order_time)+1 ) as Time_interval from pizza_sales1
)a
where month(order_date)=1
group by Time_interval order by orders_as_per_hour DESC







