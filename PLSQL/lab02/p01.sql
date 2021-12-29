SELECT last_name, first_name, to_char(hire_date, 'dd Month YYYY'), to_char(salary, 'FM$99999.00') as salary , commission_pct,
salary*commission_pct+ salary as "Доход",
(CASE 
WHEN salary*commission_pct <= 5000 THEN 'LOW' 
WHEN salary*commission_pct > 5000 AND salary <= 10000 THEN 'Medium'
ELSE 'High' END) as classification
FROM HR.employees
WHERE 1=1 
AND commission_pct  IS NOT NULL
AND (salary*12 > 100000 AND salary*12 < 150000);

