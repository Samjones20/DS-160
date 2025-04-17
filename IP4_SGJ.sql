use premier_products;
show tables;
-- 1. print all rows and columns of the dataset
select * from customer;
select * from order_line;
select * from orders;
select * from part;
select * from sales_rep;

-- 2. all rows, last name, first name, sales rep number, city from sales rep table
select last_name, first_name, sales_rep_num, city from sales_rep;

-- 3. select order and customer number from orders
select order_num, customer_num from orders;

-- 4. select only two rows from order line
select * from order_line limit 2;

-- 5. select all entries from customer where sales rep num = 20
select * from customer where sales_rep_num = 20;

-- 6. select only customer name, balance, credit limit from customer where sales rep num = 20
select customer_name, balance, credit_limit from customer where sales_rep_num = 20;

-- 7. select part num, num ordered, quoted price, and total price for order 21617 where only 1 num ordered
select part_num, num_ordered, quoted_price, (num_ordered * quoted_price) as total_price 
from order_line 
where num_ordered = 1 and order_num = 21617;

-- 8. show all the orders from order date between '2010-10-20' and '2010-10-22'
select * from orders where order_date between '2010-10-20' and '2010-10-22';

-- 9. list all parts where the part description starts with ‘d’ and ends with ‘er’
select * from part where part_description like 'd%er';

-- 10. show total balance from customer
select sum(balance) as total_balance from customer;

-- 11. show minimum balance from customer
select min(balance) as min_balance from customer;

-- 12. count number of customers in customer table
select count(*) as customer_count from customer;

-- 13. select order number where the quoted price is between 500 and 1000
select order_num from order_line where quoted_price between 500 and 1000;

-- 14. create a new table of customer name, last name, and first name by joining customer and sales rep table
select c.customer_name, s.last_name, s.first_name
from customer c
inner join sales_rep s
on c.sales_rep_num = s.sales_rep_num;