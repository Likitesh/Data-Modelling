use X_Mart;

-- How many transactions have been done by each gender?
select s.order_id, c.gender, count(gender) as total
from sales_fact s inner join customer_info c
using (customer_id)
group by gender;

-- How many transactions have been done by male customers?
select s.order_id, c.gender, count(gender) as total
from sales_fact s inner join customer_info c
using (customer_id)
where gender = 'male'
group by gender;

-- Which customers have placed an order from more than one store?
select customer_id, count(distinct store_id) as stores
from sales_fact
group by customer_id
having stores > 1;

-- How many customers have placed an order from more than one store?
select count(customer_id)
from (select  customer_id, count(distinct store_id) as stores
from sales_fact
group by customer_id
having stores > 1) as stores;

-- City with total number of orders?
select b.city, count(s.order_id) as total
from branch_details b inner join sales_fact s
using (store_id)
group by city;

-- Which city has the highest number of orders?
select b.city, count(s.order_id) as total
from branch_details b inner join sales_fact s
using (store_id)
group by city
limit 1;

-- Which state has the highest number of customers?
select b.state, count(distinct s.order_id) as total
from branch_details b inner join sales_fact s
using (store_id)
group by state
order by total desc;