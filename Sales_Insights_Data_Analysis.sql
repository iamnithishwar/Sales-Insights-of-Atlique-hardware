#-- To pull datas from customers table
select *
from sales.customers;

#-- To pull datas from date table
select *
from sales.date;

#-- To pull datas from markets table
select *
from sales.markets;

#-- To pull datas from products table
select *
from sales.products;

#-- To pull datas from transactions table
select *
from sales.transactions;


#--To pull specific column
select product_code, customer_code,order_date
from sales.transactions;


#-- To pull sales amout that has 0 and < 0
SELECT * 
FROM sales.transactions
where sales_amount <=0;


#-- To pull unique value of currency to see if there is any duplicates present or not
SELECT distinct(transactions.currency) 
FROM sales.transactions;


#--To pull count of unique value 'INR' 
#We gonna remove this duplicate instead of 'INR\r' because INR has less number of values
select count(*)
from transactions
where currency = 'INR';


#--To pull count of unique value 'INR\r'
select count(*)
from transactions
where currency = 'INR\r';


#-- To pull duplicates records
select *
from transactions
where currency = 'USD' or currency = 'USD\r';


#-- Connecting date table and transaction table using date column
select sales.transactions.*, sales.date.*
from sales.transactions
inner join sales.date
on sales.transactions.order_date = sales.date.date;


#-- To pull datas of specific year
select sales.transactions.*, sales.date.*
from sales.transactions
inner join sales.date
on sales.transactions.order_date = sales.date.date
where sales.date.year = 2020;


#--To pull total revenue or total sales amount in year 2020
#-- We can change the year to see results of that year
select sum(sales.transactions.sales_amount)
from sales.transactions
inner join sales.date
on sales.transactions.order_date = sales.date.date 
where sales.date.year = 2020;


#--To pull total revenue or total sales amount in year 2020 and in a specific month
select sum(sales.transactions.sales_amount)
from sales.transactions
inner join sales.date
on sales.transactions.order_date = sales.date.date 
where sales.date.year = 2020 and date.month_name = 'January'
and currency = 'INR\r' or currency = 'USD\r';


#--To pull total sales quantity in year 2020 and in a specific month
select sum(sales.transactions.sales_qty)
from sales.transactions
inner join sales.date
on sales.transactions.order_date = sales.date.date 
where sales.date.year = 2020 and date.month_name = 'January'
and currency = 'INR\r' or currency = 'USD\r';


#-- To Know or pull the datas of business that we did in chennai 
select sum(sales.transactions.sales_amount)
from sales.transactions
inner join sales.date
on sales.transactions.order_date = sales.date.date 
where sales.date.year = 2020 and sales.transactions.market_code = "Mark001";


#-- To pull distinct product that we sold in chennai
select distinct product_code
from sales.transactions
where market_code = "Mark001";



