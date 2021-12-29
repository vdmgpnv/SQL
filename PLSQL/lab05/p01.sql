CREATE TABLE employees AS SELECT * FROM HR.employees WHERE 1=2

\
CREATE TABLE customers
(customer_id number(10, 0),
date_register date NOT NULL,
login varchar2(10 byte) NOT NULL,
phone varchar2(11 byte),
first_name_last_name varchar2(20 byte),
email varchar(50 byte) UNIQUE NOT NULL,
ship_address varchar2(50 byte),
CONSTRAINT gaponov_vs_pk PRIMARY KEY(customer_id)
);

\
CREATE TABLE products
(product_id number(4, 0),
price number(6, 2) NOT NULL,
name  varchar2(10 byte) NOT NULL,
decription varchar2(50 byte),
CONSTRAINT gaponov_vs_pk PRIMARY KEY(product_id)
)

CREATE TABLE orders
(order_id number(4, 0) PRIMARY KEY,
employee_id number(6,0),
product_id  number(4, 0),
order_date date NOT NULL,
qtu number(4, 0) NOT NULL,
customer_id number(4, 0),
FOREIGN KEY (product_id)
REFERENCES products(product_id),
FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);



