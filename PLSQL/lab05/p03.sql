UPDATE employees 
SET salary = salary + salary;
COMMIT;

\
UPDATE employees
SET salary = (select max(salary) from employees)
WHERE salary = (select min(salary) from employees);
COMMIT;

\
UPDATE orders
SET employee_id = (select max(employee_id) from employees)
WHERE employee_id = (select min(employee_id) from employees);
COMMIT;

\
DELETE FROM orders 
WHERE customer_id = (SELECT max(customer_id) FROM customers);
COMMIT;
