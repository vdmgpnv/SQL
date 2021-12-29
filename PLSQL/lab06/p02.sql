CREATE SEQUENCE empl_s
     START WITH 10
     INCREMENT BY 1;
     
CREATE SEQUENCE cust_s
     START WITH 11
     INCREMENT BY 1;
     
CREATE SEQUENCE pr_s
     START WITH 12
     INCREMENT BY 1;
     
CREATE SEQUENCE ord_s
     START WITH 11
     INCREMENT BY 1;
     COMMIT;
     
\
INSERT INTO employees VALUES (empl_s.nextval, 'Albina', 'Pupkina', 'pupok@mail.com', 121346547, '01.06.20',
'IT_PROG', 16000, 0, 1,1);

INSERT INTO customers VALUES(cust_s.nextval, '15.07.21', 'babaduk', 569897, 'Nikolay Baskov',
'baskov@gmail.com', 'Baskov ship adress');

INSERT INTO products VALUES (pr_s.nextval, 2.99, 'Product11', 'The best product');

INSERT INTO orders VALUES (ord_s.nextval , 1, '1', '17.02.21', '1', '1');

COMMIT;

\
CREATE INDEX index_date
ON orders (order_date);


select * from employees
