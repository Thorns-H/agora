"""
    Este archivo contiene los comportamientos de las consultas que haremos
    a la base de datos en la entidad 'busco_compro.
"""

from modules.database.querys.connection import get_connection

def new_search_purchase(id_user: int, status: str, description: str, date: str, title: str) -> bool:

    agora = get_connection()

    with agora.cursor() as cursor:
        cursor.execute("INSERT INTO busco_compro(ID_Usuario, Estado, Descripcion, Fecha, Titulo) VALUES (%s, %s, %s, %s, %s)", (id_user, status, description, date, title))
    
    agora.commit()
    agora.close()

    return True