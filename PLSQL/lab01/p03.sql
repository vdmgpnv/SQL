SELECT last_name||' '|| CAST(first_name as CHAR(1)) || '.' "ФИО"
FROM HR.employees;

\
SELECT last_name||' '||CAST(first_name as CHAR(1)) || '.' "ФИО",
length(last_name||' '||CAST(first_name as CHAR(1)) || '.') as "Количество символов"
FROM HR.employees;

\
SELECT FLOOR((TRUNC(sysdate) - TRUNC(to_date('2014/01/01', 'yyyy/mm/dd')))/7) as "weeks"
FROM dual;

\
SELECT to_char(sysdate + interval '5' minute, 'yyyy/mm/dd HH24:mi:ss' ) as "plus 5 min"
FROM dual;

\
SELECT NEXT_DAY('01.09.2021', 'Понедельник') as "Monday date"
FROM dual;
