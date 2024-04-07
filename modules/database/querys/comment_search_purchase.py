"""
    Este archivo contiene los comportamientos de las consultas que haremos
    a la base de datos en la entidad 'comentario_busco_compro.
"""

from modules.database.querys.connection import get_connection

def new_comment_search_purchase(id_search_purchase: int, name: str, comment: str, date: str) -> bool:

    agora = get_connection()

    with agora.cursor() as cursor:
        cursor.execute("INSERT INTO busco_compro(ID_Busco_Compro, Nombre, Comentario, Fecha) VALUES (%s, %s, %s, %s)", (id_search_purchase, name, comment, date))
    
    agora.commit()
    agora.close()

    return True