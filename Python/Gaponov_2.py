import cx_Oracle
import datetime

from sqlalchemy import create_engine, MetaData, Table, column, String, Float, DATE, select, func, delete
from sqlalchemy.sql.elements import between
from sqlalchemy.sql.expression import and_
from sqlalchemy.sql.functions import session_user
from sqlalchemy.orm import Session


cx_Oracle.init_oracle_client(
    lib_dir=r"C:\Users\Vadim\Downloads\instantclient-basic-windows.x64-21.3.0.0.0\instantclient_21_3")
DIALECT = 'oracle'
DRIVER = 'cx_oracle'
USER = 'GAPONOV_VS'
PASSWORD = '123321105qQ_'
HOST = '13.95.119.25'
PORT = 1521
SERVICE = 'dereboot'


DB_PATH = f'{DIALECT}+{DRIVER}://{USER}:{PASSWORD}@{HOST}:{PORT}/?service_name={SERVICE}'

# создание подключения


def db_connect(db_path):
    try:
        engine = create_engine(db_path)
    except:
        print('ErrorConnection')
    return engine

# Необходимо создать функции расчета трат
# Первая функция должна рассчитывать траты по всем группам в рамках одного дня.
# То есть, вы передаёте дату, а функция возвращает вам агрегированные суммы трат по группам
# Например: у нас имеется три записи:
# 20.01.2021 Продукты 100
# 20.01.2021 Продукты 200
# 19.01.2021 Такси 150
# Если передать функции дату 20.01.2021, то она должна вывести:
# 20.01.2021 Продукты 300


def get_summ_though_categories(date):
    engine = db_connect(DB_PATH)
    metadata = MetaData(engine)
    metadata.reflect()
    tbl_paytax = metadata.tables['paytax']
    select_from_paymax = select([tbl_paytax.c.c_group, func.sum(tbl_paytax.c.c_sum)]).where(func.trunc(
        tbl_paytax.c.c_date) == date).group_by(tbl_paytax.c.c_group)
    res = select_from_paymax.execute()
    for i in res:
        print(date, end=' ')
        for j in i:
            print(j, end=' ')
        print('')


# Вторая функция должна рассчитывать траты по всем группа в рамках периода.
# То есть, функция должна принимать две даты и возвращать вам агрегированные суммы трат по группа в рамках периода

def get_data_for_groups_in_period(start_date, end_date):
    engine = db_connect(DB_PATH)
    metadata = MetaData(engine)
    metadata.reflect()
    tbl_paytax = metadata.tables['paytax']
    select_from_paymax = select([tbl_paytax.c.c_group, func.sum(tbl_paytax.c.c_sum)]).where(and_(start_date <= func.trunc(
        tbl_paytax.c.c_date), func.trunc(
        tbl_paytax.c.c_date) <= end_date)).group_by(tbl_paytax.c.c_group)
    res = select_from_paymax.execute()
    for i in res:
        for j in i:
            print(j, end = ' ')
        print('')
# Задание 2
# Необходимо создать функцию, которая сможет удалить последнюю запись в таблице


def delete_last_row():
    engine = db_connect(DB_PATH)
    metadata = MetaData(engine)
    metadata.reflect()
    tbl_paytax = metadata.tables['paytax']
    max_id = select([func.max(tbl_paytax.c.c_id)]).execute().fetchall()[0][0]
    delete(tbl_paytax).where(tbl_paytax.c.c_id == max_id).execute()


# Задание 3
# Необходимо создать функцию, которая предупредит вас о том, что вы потратили больше, чем нужно в рамках Месяца
# Предположим, у вас есть бюджет в 5 000 рублей, который направлен на развлечения или ваши увлечения
# Если вы потратите больше, чем 5 000 на конкретную группу трат, то функция должна будет вас об этом предупредить сообщением:
# "Вы вышли за пределы лимита в 5 000 рублей"

def notification_when_spend_much_money():
    limit = 5000
    engine = db_connect(DB_PATH)
    metadata = MetaData(engine)
    metadata.reflect()
    tbl_paytax = metadata.tables['paytax']
    select_from_paymax = select([tbl_paytax.c.c_group, func.sum(tbl_paytax.c.c_sum)]).where(
        func.to_char(tbl_paytax.c.c_date, 'mm.yy') == datetime.date.today().strftime('%m.%y')).group_by(tbl_paytax.c.c_group).execute()
    for i in select_from_paymax:
        if i[-1] > limit:
            print('Вы превысели траты за месяц на категорию: ' + i[0])


if __name__ == '__main__':
    #get_summ_though_categories('19.10.21')
    #delete_last_row()
    #notification_when_spend_much_money()
    #get_data_for_groups_in_period('18.10.21', '22.10.21')