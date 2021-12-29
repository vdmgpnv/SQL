SELECT employee_id, last_name, first_name, 
        (SELECT department_name
         FROM   HR.departments
         WHERE  department_id = e.department_id) as DEPARTMENT_NAME,
        (SELECT job_title
         FROM   HR.jobs
         WHERE  job_id = e.job_id) as JOB_TITLE, salary
FROM HR.employees e
WHERE salary > (SELECT AVG (salary) FROM HR.employees );

\
SELECT employee_id, last_name,
        first_name, 
            (SELECT department_name
             FROM   HR.departments
             WHERE  department_id = e.department_id) as DEPARTMENT_NAME,
                 (SELECT job_title
                  FROM   HR.jobs
                  WHERE  job_id = e.job_id) as JOB_TITLE, salary
FROM HR.employees e
WHERE salary < ALL
                (SELECT salary
                FROM HR.employees
                WHERE department_id=30);

\
SELECT department_id,
        (SELECT department_name
         FROM HR.departments
         WHERE department_id = e.department_id) as DEPARTMENT_NAME,
         SUM(salary)
FROM HR.employees e

HAVING SUM(salary) > ALL
                (SELECT AVG(salary) FROM HR.employees
                 GROUP BY department_id)
GROUP BY department_id;
