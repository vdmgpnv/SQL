CREATE OR REPLACE FUNCTION get_orders(p_emp_id NUMBER,  p_fd_months VARCHAR2 DEFAULT '01.01.01') RETURN VARCHAR2
IS
    invalid_id EXCEPTION;
    invalid_date EXCEPTION;
    l_emp_id INTEGER  := p_emp_id;
    l_fd_months DATE  := TO_DATE(p_fd_months, 'dd.mm.yy');
    l_cnt_ord INTEGER := 0;
    tmp_emp NUMBER;
BEGIN
    SELECT count(*) INTO tmp_emp FROM employees WHERE employee_id = l_emp_id;

    IF tmp_emp = 0 THEN RAISE invalid_id;
    END IF;
    
    IF l_fd_months = '01.01.01' THEN
        SELECT COUNT(*) INTO l_cnt_ord FROM ORDERS WHERE employee_id = l_emp_id;
    ELSE
        SELECT COUNT(*) INTO l_cnt_ord FROM ORDERS WHERE employee_id = l_emp_id 
                                            AND TO_CHAR(order_date, 'mm.yy') = to_char(l_fd_months, 'mm.yy');
        IF l_cnt_ord = 0 THEN RAISE invalid_date;
        END IF;
    END IF;
    RETURN to_char(l_cnt_ord);
    EXCEPTION
        WHEN invalid_id THEN RETURN 'invalid_id!!!';
        WHEN invalid_date THEN RETURN 'invalid_date!!!';
        
END get_orders;

\
DECLARE
all_good VARCHAR2(10);
bad_month VARCHAR2(20);
without_month VARCHAR2(20);
bad_employee VARCHAR2(20);
BEGIN
SELECT get_orders(2, '12.02.21') INTO all_good FROM DUAL;
SELECT get_orders(2, '12.02.23') INTO bad_month FROM DUAL;
SELECT get_orders(2) INTO without_month FROM DUAL;
SELECT get_orders(555) INTO bad_employee FROM DUAL;
dbms_output.put_line(all_good);
dbms_output.put_line(bad_month);
dbms_output.put_line(without_month);
dbms_output.put_line(bad_employee);
END;