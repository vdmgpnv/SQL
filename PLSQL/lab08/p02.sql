CREATE OR REPLACE PROCEDURE addorders(p_emp_id NUMBER, p_prod_id NUMBER, p_cust_id NUMBER, p_qty NUMBER, p_order_date DATE DEFAULT TO_DATE(SYSDATE, 'dd.mm.yy')) 
IS  
    inv_qty EXCEPTION;
    inv_emp_id EXCEPTION;
    inv_prod_id EXCEPTION;
    inv_cust_id EXCEPTION;
    l_emp_id INTEGER  := p_emp_id;
    l_prod_id INTEGER := p_prod_id;
    l_cust_id INTEGER := p_cust_id;
    l_qty INTEGER     := p_qty;
    l_order_date DATE := p_order_date;
    tmp_emp NUMBER;
    tmp_prod NUMBER;
    tmp_cust NUMBER;
BEGIN
    SELECT count(*) INTO tmp_emp FROM employees WHERE employee_id = l_emp_id;
    SELECT count(*) INTO tmp_prod FROM products WHERE product_id = l_prod_id;
    SELECT count(*) INTO tmp_cust FROM customers WHERE customer_id = l_cust_id;
    IF tmp_emp = 0 THEN
        RAISE inv_emp_id;
    ELSIF tmp_prod = 0 THEN
        RAISE inv_prod_id;
    ELSIF tmp_cust = 0 THEN
        RAISE inv_cust_id;
    ELSIF l_qty < 0 THEN
        RAISE inv_qty;
    ELSE 
        INSERT INTO orders VALUES(ord_s.nextval, l_emp_id, l_prod_id, l_order_date, l_qty, l_cust_id);
        dbms_output.put_line('Вставка прошла успешно');
        commit;
    END IF;
    
    EXCEPTION
    WHEN NO_DATA_FOUND THEN DBMS_OUTPUT.PUT_LINE('Нарушены Связи');
    WHEN inv_qty THEN DBMS_OUTPUT.PUT_LINE('Кол-во заказов не может быть отрицательным');
    WHEN inv_emp_id THEN DBMS_OUTPUT.PUT_LINE('Введен неверный индетификатор сотрудника');
    WHEN inv_prod_id THEN DBMS_OUTPUT.PUT_LINE('Введен неверный индентификатор товара');
    WHEN inv_cust_id THEN DBMS_OUTPUT.PUT_LINE('Введен неверный индентификатор клиента');
END addorders;

\
begin
addorders('111','1','1','1');
addorders('1','111','1','1');
addorders('1','1','111','1');
addorders('1','1','1','-2');
addorders('1','1','1','1');
end;
