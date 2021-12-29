INSERT INTO employees VALUES (1, 'employee1', 'Gaponov', 'gaponov@gmail.com', 9876543212, '10.11.96', 'IT_PROG', 16000, 0, 1,1);
INSERT INTO employees VALUES (2, 'employee2', 'Salenko', 'Salenko@mail.com', 1234567898, '22.02.21', 'COUR', 4000, 0.1, 1,1);
INSERT INTO employees VALUES (3, 'employee3', 'Popova', 'Popova@yandex.ru', 56789054321, '12.12.20', 'MANAG', 10000, 0, 1,1);
INSERT INTO employees VALUES (4, 'employee4', 'Fink', 'Fink@vk.com', 543216789, '23.03.11', 'CLERK', 1500, 0.1, 1,11);
INSERT INTO employees VALUES (5, 'employee5', 'Osipov', 'Osipov@rambler.com', 3213456789, '01.08.09', 'SEC', 1500, 0, 1,1);
COMMIT;

\
INSERT INTO customers VALUES(1, '05.04.21', 'solitary', 87187924619, 'Vadim Gaponov',
'gaponov@gmail.com', 'City, street, flat');
INSERT INTO customers VALUES(2, '01.01.21', 'remedy', 89214712423, 'Bari Alibasov',
'alib@mail.com', 'City1, street1, flat1');
INSERT INTO customers VALUES(3, '04.02.21', 'insensible', 98137871432, 'Prohor Shalyapin',
'prohor@gmail.com', 'City2, street2, flat2');
INSERT INTO customers VALUES(4, '01.10.21', 'sincerity', 42898921312, 'Filip Kirkorov',
'filya@gmail.com', 'City3, street3, flat3');
INSERT INTO customers VALUES(5, '22.08.19', 'redeye', 4578972133, 'Maxim Galkin', 
'max@gmail.com', 'City4, street4, flat4');
COMMIT;

\
INSERT INTO products VALUES (1, 4.99, 'Product', 'Best product');
INSERT INTO products VALUES (2, 2.99, 'Product1', 'Best product1');
INSERT INTO products VALUES (3, 4.00, 'Product2 ', 'Best product2');
INSERT INTO products VALUES (4, 1.00, 'Product3 ', 'Best product3');
INSERT INTO products VALUES (5, 3.99, 'Product4', 'Best product4');
INSERT INTO products VALUES (6, 2.00, 'Product5', 'Best product5');
INSERT INTO products VALUES (7, 3.50, 'Product6', 'Best product6');
INSERT INTO products VALUES (9, 1.99, 'Product7', 'Best product7');
INSERT INTO products VALUES (10, 2.99, 'Product8', 'Best product8');
INSERT INTO products VALUES (11, 2.99, 'Product9', 'Best product9');
COMMIT;

\
INSERT INTO orders VALUES (1, 2, '1', '11.01.21', '1', '1');
INSERT INTO orders VALUES (2, 2, '2', '12.02.21', '4', '1');
INSERT INTO orders VALUES (3, 3, '3', '13.03.21',  '1', '2');
INSERT INTO orders VALUES (4, 3, '4', '14.04.21', '2', '2');
INSERT INTO orders VALUES (5, 4, '5', '15.05.21', '6', '3');
INSERT INTO orders VALUES (6, 4, '6', '16.06.21', '5', '5');
INSERT INTO orders VALUES (7, 5, '7', '17.07.21', '2', '5');
INSERT INTO orders VALUES (8, 5, '9', '18.08.21', '1', '3');
INSERT INTO orders VALUES (9, 1, '10', '19.09.21', '4', '4');
INSERT INTO orders VALUES (10, 1, '11', '20.10.21', '5', '4');
COMMIT;


