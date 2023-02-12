select * from supermarket_sales

--total unit price
select sum(unit_price)
from supermarket_sales

--total price
select sum(total)
from supermarket_sales

--total quntity
select sum(quantity)
from supermarket_sales

--maximun quantity sold date
select max(quantity), date, time
from  supermarket_sales
group by 2, 3
order by 1 desc

--top ten cost of good sold
select product_line, gender, customer, cogs
from supermarket_sales
group by 1, 2, 3, 4
order by cogs desc
limit 10

-- average unit price by product line, genderm customer
select avg(unit_price),product_line, gender, customer
from supermarket_sales
group by 2,3,4
order by 1 desc

select * from supermarket_sales

__
select product_line,gender, quantity,unit_price, total,payment,
cogs, tax_5percent, rating
from supermarket_sales
group by 1,2,3,4,5,6,7,8,9
order by total desc

select max(total)
from supermarket_sales

--payment count
select payment, count(payment)
from supermarket_sales
group by 1
order by 2 desc

--gender that payment method
select payment, gender, count(payment)
from supermarket_sales
group by 1,2
order by 3 desc

--product line payment method
select payment, product_line, count(payment)
from supermarket_sales
group by 1,2
order by 3 desc

--city  line payment method
select payment, city, count(payment)
from supermarket_sales
group by 1,2
order by 3 desc

---branch line payment method
select payment, branch, count(payment)
from supermarket_sales
group by 1,2
order by 3 desc

--branch line payment method
select payment, branch, count(payment)
from supermarket_sales
group by 1,2
order by 3 desc

--branch line payment method
select payment, customer, count(payment)
from supermarket_sales
group by 1,2
order by 3 desc

select *from supermarket_sales

--sum all base on product line
select product_line,
sum(total) sum_total,
sum(quantity)quality_sum,
sum(unit_price) sum_unit_price,
sum(tax_5percent) sum_tax,
sum(cogs) sum_sum_of_good_sold,
sum(gross_income)sum_gross_income
from supermarket_sales
group by 1
order by 3 desc

--sum all base on gender
select gender,
sum(total) sum_total,
sum(quantity)quality_sum,
sum(unit_price) sum_unit_price,
sum(tax_5percent) sum_tax,
sum(cogs) sum_sum_of_good_sold,
sum(gross_income)sum_gross_income
from supermarket_sales
group by 1
order by 3 desc


--sum all base on city
select city,
sum(total) sum_total,
sum(quantity)quality_sum,
sum(unit_price) sum_unit_price,
sum(tax_5percent) sum_tax,
sum(cogs) sum_sum_of_good_sold,
sum(gross_income)sum_gross_income
from supermarket_sales
group by 1
order by 3 desc

--sum all base on customer
select customer,
sum(total) sum_total,
sum(quantity)quality_sum,
sum(unit_price) sum_unit_price,
sum(tax_5percent) sum_tax,
sum(cogs) sum_sum_of_good_sold,
sum(gross_income)sum_gross_income
from supermarket_sales
group by 1
order by 3 desc

--when was the highest gross income made  order by date
select product_line,
payment,
gross_income,
quantity,
unit_price,
date
from supermarket_sales
group by 1,2,3,4,5,6
having date = '2019-01-01'
order by date, gross_income desc

--view as jan sales
create view jan_cash_sales as
select product_line,
payment,
gross_income,
cogs,
quantity,
unit_price,
date
from supermarket_sales
group by 1,2,3,4,5,6,7
having payment= 'Cash' and date between '2019-01-01' and '2019-01-31'
order by date, gross_income desc

--cost of goods sold ranking
SELECT product_line,
payment,
cogs,
date,
CASE WHEN cogs >= 700 THEN 'high sales'
WHEN cogs >= 400 AND cogs < 700 THEN 'average sales'
ELSE 'low sales' END  as sales_category,
from jan_cash_sales
order by cogs desc
