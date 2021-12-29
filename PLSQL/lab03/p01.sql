SELECT last_name,department_name, city, country_name
FROM HR.employees e
JOIN HR.departments d ON (e.department_id = d.department_id)
JOIN HR.locations l ON (d.location_id = l.location_id)
JOIN HR.countries c ON (l.country_id = c.country_id);

\
SELECT department_name, last_name
FROM HR.departments d
LEFT OUTER JOIN HR.employees e ON (d.manager_id = e.employee_id);

\
SELECT  j.last_name
FROM    HR.employees j
WHERE   hire_date NOT IN
        (SELECT end_date FROM HR.job_history k
        WHERE k.employee_id = j.employee_id)
        AND j.employee_id NOT IN
        (SELECT employee_id FROM HR.job_history)
ORDER BY  last_name;
        
        







