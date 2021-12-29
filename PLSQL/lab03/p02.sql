SELECT  (e.last_name ||' '|| e.first_name) as employee_fi,
        (m.last_name ||' '|| m.first_name) as manager_fi
FROM    HR.employees e
LEFT JOIN HR.employees m ON (e.manager_id = m.employee_id) 
ORDER BY  (e.last_name ||' '|| e.first_name);

\
SELECT  e.last_name  as employee_fi, j.job_id
FROM    HR.employees e
INNER JOIN  HR.job_history j ON (e.employee_id = j.employee_id) 
ORDER BY    e.last_name, j.start_date;

\
SELECT  e.employee_id as first_player,
        m.employee_id as second_player
FROM    HR.employees e
CROSS JOIN HR.employees m 
WHERE      e.department_id = 30 AND m.department_id = 30 AND m.employee_id > e.employee_id;









