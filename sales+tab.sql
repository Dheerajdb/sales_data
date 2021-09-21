# Show all customers records
SELECT * FROM customers;
# show total number of customers.
select count(*) from customers;
select distinct customer_type from customers;
# Show all date records.
select * from date;
# Show all market records.
select * from markets;
# Show different zones.
select distinct zone from markets;
# Show all products records.
select * from products;
# Show different product type. 
select distinct product_type from products;
# Show all transactions record.
select * from transactions;
# Show total no. of transactions.
select count(*) from transactions;
# Show different currency from transactions.
select distinct currency from transactions;
# Show transactions for chennai market (market code for chennai is Mark001).
SELECT * FROM transactions where market_code='Mark001';
# Show total revenue in Chennai.
select sum(sales_amount) from transactions where market_code='Mark001';
# Show distinct product codes that were sold in Chennai.
SELECT distinct product_code FROM transactions where market_code='Mark001';
# Show no. of sales amount where currency is  USD.
select count(sales_amount) from transactions where currency = 'USD';
# Show no. of sales amount where currency is  USD.
select count(sales_amount) from transactions where currency = 'INR';
# Show total no. of transactions where currency is USD.
select sum(sales_amount) from transactions where currency = 'USD';
# Show total no. of transactions where currency is INR.
select sum(sales_amount) from transactions where currency = 'INR';
# Show transactions in 2020 join by date table.
SELECT transactions.*, date.year FROM transactions INNER JOIN date ON transactions.order_date=date.date where date.year=2020;
# Show transactions in jan 2020 join by date table.
SELECT transactions.*, date.* FROM transactions INNER JOIN date ON transactions.order_date=date.date where date.year=2020 and date.month_name = 'January';
# Show total revenue in Janauary, 2020.
SELECT SUM(transactions.sales_amount) FROM transactions INNER JOIN date ON transactions.order_date=date.date where date.year=2020  and date.month_name="January";
# Show total revenue in year 2020 in Chennai.
SELECT SUM(transactions.sales_amount) FROM transactions INNER JOIN date ON transactions.order_date=date.date where date.year=2020  and transactions.market_code="Mark001";
# Show total revenue in respective year.
SELECT sum(transactions.sales_amount), date.year FROM transactions INNER JOIN date ON transactions.order_date=date.date group by year;
# Show total revenue in respective markets name.
SELECT sum(transactions.sales_amount), markets.markets_name FROM transactions INNER JOIN markets ON transactions.market_code=markets.markets_code group by markets_name;
# Show total revenue in respective zone.
SELECT sum(transactions.sales_amount), markets.zone FROM transactions INNER JOIN markets ON transactions.market_code=markets.markets_code group by zone;
# Show top 3 sales amount products.
select product_code, sales_amount from transactions group by product_code order by sales_amount desc limit 3;
# Show fifth highest sales amount of products.
select product_code, sales_amount from transactions group by product_code order by sales_amount desc limit 4,1;
select * from (select product_code, sales_amount, dense_rank() over (partition by product_code order by sales_amount desc) as xyz from transactions) as sas where xyz= 5;












