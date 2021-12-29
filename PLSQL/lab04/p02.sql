SELECT c.country_name, city, COUNT (*),
                                (SELECT COUNT(*)
                                FROM HR.departments d
                                WHERE location_id = l.location_id) as COUNT_DEP
FROM HR.employees e
JOIN HR.departments d ON (e.department_id = d.department_id)
JOIN HR.locations l ON (d.location_id = l.location_id)
JOIN HR.countries c ON (l.country_id = c.country_id)
HAVING COUNT(employee_id) > ANY
                            (SELECT COUNT(*) FROM HR.employees e
                            JOIN HR.departments d ON (e.department_id = d.department_id)
                            JOIN HR.locations l ON (d.location_id = l.location_id)
                            WHERE city = 'Southlake' OR city = 'Seattle' )
GROUP BY c.country_name, city, l.location_id;
       
\
SELECT employee_id, last_name, first_name,
    (SELECT department_name from HR.departments d where e.department_id = d.department_id) department_name,
    (SELECT job_title from HR.jobs j where e.job_id = j.job_id) job_title, salary, concat(to_char(salary / (sum(salary) OVER (partition BY department_id)) * 100, '99.99'), '%') 
from HR.employees e
WHERE department_id = 80;
       
       
       
    
