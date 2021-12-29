CREATE TABLE sales_report
(date_report DATE,
product_id number(4, 0),
qty number(4, 0),
orders number(4, 0),
customers number(4, 0),
new_customers number(4, 0),
total_sum number(4, 0),
CONSTRAINT dt_prod_pk PRIMARY KEY (date_report, product_id)
);

\
SET SERVEROUTPUT ON;
DECLARE
    counte INTEGER :=0;
    v_cnt_rows integer:=0;
    v_date_report orders.order_date%TYPE;
    v_product_id orders.product_id%TYPE;
    v_qty orders.qtu%TYPE;
    v_orders orders.order_id%TYPE;
    v_customers orders.customer_id%TYPE;
    v_new_customers orders.customer_id%TYPE;
    v_total_sum orders.qtu%TYPE;
    CURSOR comp_cud IS
          select last_day(order_date) as date_report, o.product_id, sum(qtu) as qty,
          count(*) as ordersss, count(customer_id) as customers,
    (select count(*) from customers
    where last_day(date_register) = last_day(order_date) ) new_customer, sum(p.product_id * qtu)
    from orders o
    inner join products p ON (p.product_id = o.product_id)
    group by last_day(order_date), o.product_id;

BEGIN
    open comp_cud;
          LOOP
          FETCH comp_cud INTO 
          v_date_report ,
          v_product_id,
          v_qty ,
          v_orders ,
          v_customers ,
          v_new_customers,
          v_total_sum;
          INSERT /*+ ignore_row_on_dupkey_index(sales_report, dt_prod_pk) */ INTO sales_report VALUES(v_date_report ,v_product_id,v_qty ,v_orders ,v_customers ,v_new_customers, v_total_sum);
          counte := counte + 1;
            IF counte = 5 THEN counte :=0; COMMIT;
            END IF;
        
           EXIT WHEN comp_cud%notfound;
           v_cnt_rows:= v_cnt_rows+1;
           END LOOP; 
         CLOSE comp_cud;
    DBMS_OUTPUT.PUT_LINE('ВСТАВЛЕННО ' || v_cnt_rows || 'строк');
END;