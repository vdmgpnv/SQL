CREATE OR REPLACE PACKAGE orders_pack
AS

END orders_pack;

\
CREATE OR REPLACE PACKAGE BODY orders_pack
AS

END orders_pack;

\
DECLARE
all_good VARCHAR2(10);
BEGIN 
select orders_pack.get_orders(2, '12.02.21') INTO all_good FROM DUAL;
orders_pack.addorders('1','1','1','1');
orders_pack.build_sales_report;
DBMS_OUTPUT.PUT_LINE(all_good);
END;

