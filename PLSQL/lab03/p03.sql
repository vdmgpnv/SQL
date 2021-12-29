SELECT d.department_name, COUNT(e.employee_id) as COUNT
FROM HR.departments d
LEFT JOIN HR.employees e ON (e.department_id = d.department_id)
GROUP BY d.department_name;

\
SELECT c.country_name, COUNT(*)
FROM HR.countries c
JOIN HR.locations l ON (c.country_id = l.country_id)
JOIN HR.departments d ON (l.location_id = d.location_id)
GROUP BY c.country_name
HAVING COUNT(*) > 1;

\
SELECT country_name, COUNT(*)
FROM HR.employees e
LEFT JOIN HR.departments d ON (e.department_id = d.department_id)
LEFT JOIN HR.locations l ON (l.location_id = d.location_id)
LEFT JOIN HR.countries c ON (c.country_id = l.country_id)
GROUP BY country_name;

\
SELECT DISTINCT country_name, city
FROM HR.countries c
LEFT JOIN HR.locations l ON (c.country_id = l.country_id)
LEFT JOIN HR.departments d ON (d.location_id = l.location_id)
WHERE d.location_id NOT IN (SELECT d.location_id
                               FROM HR.departments
                              WHERE d.location_id IS NOT NULL)
GROUP BY  country_name, city
ORDER BY city;



