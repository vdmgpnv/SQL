CREATE VIEW emp_summary
AS SELECT  e.last_name || ' ' || e.first_name as "FIO", count(order_id) as ORDERS , sum(p.price * o.qtu) as PROFIT,
count(c.customer_id) as CUST,  concat(to_char(sum(p.price * o.qtu)/(SELECT  sum(p.price * o.qtu) 
FROM  orders o
INNER JOIN products p on p.product_id = o.product_id) *100, '99.99'), '%') as PERCENT
FROM  orders o
INNER JOIN employees e on e.employee_id = o.employee_id
INNER JOIN products p on p.product_id = o.product_id
INNER JOIN customers c on c.customer_id = o.customer_id
GROUP BY e.last_name, e.first_name;

\
CREATE VIEW cust_summary
AS SELECT  c.login || ' ' || c.first_name_last_name as "client", count(order_id) as ORDERR, sum(p.price * o.qtu) as SUmOrd
FROM customers c
INNER JOIN orders o on c.customer_id = o.customer_id
INNER JOIN products p on p.product_id = o.product_id
GROUP BY c.login, c.first_name_last_name;
