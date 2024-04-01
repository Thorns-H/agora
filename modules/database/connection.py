"""
    Este archivo define las funciones relacionadas a las instancias de la base de datos,
    es importante que al usar este módulo, recuerden cerrar cada instancia hecha del mismo.
"""

import pymysql
import os
from dotenv import load_dotenv

def get_connection() -> pymysql.connections.Connection:

    load_dotenv()

    db_user = os.getenv("DB_USER")
    db_password = os.getenv("DB_PASSWORD")
    db_name = os.getenv("DB_NAME")

    return pymysql.connect(host = 'localhost', user = db_user, password = db_password, db = db_name)