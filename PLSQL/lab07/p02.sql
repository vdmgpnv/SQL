SET SERVEROUTPUT ON;
DECLARE
  v_emp_id NUMBER(4,0);
  v_orders NUMBER(4,0);
BEGIN
    SELECT employee_id,
    (SELECT COUNT(*) from orders
        WHERE employee_id = (SELECT employee_id from employees
        WHERE salary = (select min(salary) from employees)))
            INTO v_emp_id, v_orders
    FROM employees
    WHERE salary = (select min(salary) from employees );
IF v_orders > 2 THEN
DBMS_OUTPUT.PUT_LINE('Зарплата у со трудника с id = ' || v_emp_id || ' увеличена на 20%' );
UPDATE employees 
SET salary = salary + salary * 0.2
WHERE employee_id = v_emp_id;
ELSE 
DBMS_OUTPUT.PUT_LINE('Зарплата у со трудника с id = ' || v_emp_id || ' увеличена на 10%' );
UPDATE employees 
SET salary = salary + salary * 0.1
WHERE employee_id = v_emp_id;
END IF;
END;

\
DEFINE cnt_orders = 100
DECLARE
v_cnt_orders INTEGER := '&cnt_orders';
v_order_date DATE;
v_order_id NUMBER(4,0);
v_employee_id NUMBER(6,0);
v_product_id NUMBER(6,0);
v_qtu NUMBER(4,0);
v_cust_id NUMBER(4,0);
BEGIN
    FOR i in 1..v_cnt_orders
    LOOP 
        v_order_date := TRUNC(SYSDATE + DBMS_RANDOM.VALUE(0,366));
        v_order_id := ord_s.nextval;
        v_employee_id := DBMS_RANDOM.VALUE(1,5);
        v_product_id := DBMS_RANDOM.VALUE(1,12);
        v_qtu := DBMS_RANDOM.VALUE(1,5);
        v_cust_id := DBMS_RANDOM.VALUE(1,5);
        INSERT INTO orders VALUES (v_order_id, v_employee_id, v_product_id, v_order_date, v_qtu, v_cust_id);
    END LOOP;
END;

