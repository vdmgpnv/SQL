SET SERVEROUTPUT ON;
DECLARE
  v_today DATE := trunc(SYSDATE);
  v_tomorrow DATE;
BEGIN
    SELECT  v_today+1
            INTO  v_tomorrow
    FROM dual;
    DBMS_OUTPUT.PUT_LINE('Завтра: ' || v_tomorrow);  
END;

\
SET SERVEROUTPUT ON;
DECLARE
    v_today DATE := SYSDATE;
    v_tomorrow DATE := TRUNC(SYSDATE + 1);
    v_diff INTEGER;
    v_hours INTEGER;
    v_minutes INTEGER;
    v_seconds INTEGER;
BEGIN
    v_diff:=(v_tomorrow - v_today)*24*60*60; 
    v_hours := v_diff / 3600;
    v_minutes := MOD(v_diff/60, 60);
    v_seconds := MOD(v_diff, 60);
    
    DBMS_OUTPUT.PUT_LINE('До конца дня осталось: ' || v_hours ||' ч. ' 
    || v_minutes || ' мин. ' || v_seconds || ' сек. ');
END;
    

