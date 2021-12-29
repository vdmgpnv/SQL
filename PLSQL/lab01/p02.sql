SELECT *
FROM HR.employees
WHERE last_name LIKE 'K%' OR last_name LIKE 'D%'
ORDER BY salary;

\
SELECT *
FROM HR.employees
WHERE department_id LIKE '80%' OR department_id LIKE '90%' OR department_id LIKE '100%'
ORDER BY  department_id, salary;

\
SELECT *
FROM HR.employees
WHERE last_name LIKE '%a%a%' AND (department_id = 80 OR department_id = 90 OR department_id = 100) 
ORDER BY  department_id, salary