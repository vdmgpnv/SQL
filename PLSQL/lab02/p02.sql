SELECT  department_id, SUM(salary)
FROM    HR.employees
WHERE   department_id IS NOT NULL
GROUP BY department_id;
 
\
SELECT  department_id, MIN(salary)
FROM    HR.employees
WHERE   department_id IS NOT NULL
GROUP BY department_id;

\
SELECT  department_id, AVG(salary * NVL(commission_pct,0) + salary) as AVG_SALARY
FROM    HR.employees
WHERE   department_id IS NOT NULL
GROUP BY department_id;

