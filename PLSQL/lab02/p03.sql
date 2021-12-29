SELECT job_id, COUNT(job_id) as COUNT_JOB
FROM HR.employees
GROUP BY job_id;

\
SELECT  department_id, count(department_id), count(commission_pct), 
        concat(SUM(NVL(commission_pct,0)), '%')
FROM HR.employees
WHERE  department_id is not NULL 
GROUP BY department_id;

\
SELECT  employee_id
FROM    HR.job_history
GROUP BY employee_id
HAVING  COUNT(*) > 1;

\
SELECT  TO_CHAR(start_date, 'YYYY'), COUNT(*)
FROM    HR.job_history
GROUP BY TO_CHAR(start_date, 'YYYY');

\
SELECT
    COUNT(CASE WHEN salary*commission_pct <= 5000 THEN  1 END) as LOW,
    COUNT(CASE WHEN salary*commission_pct > 5000 AND salary*commission_pct <= 10000 THEN 1 END) as MEDIUM,
    COUNT(CASE WHEN salary*commission_pct > 10000 THEN 1  END) as HIGH
FROM HR.employees;



