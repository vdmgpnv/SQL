SELECT *
FROM HR.employees
WHERE salary > 5000;

\
SELECT *
FROM HR.employees
WHERE salary > 5000 and department_id = 50;

\
SELECT first_name, last_name, department_id, salary
FROM HR.employees
WHERE salary > 5000 and department_id = 50;

\
SELECT DISTINCT first_name, last_name, department_id, salary
FROM HR.employees
WHERE salary > 5000 and department_id = 50;