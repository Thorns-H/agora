"""
    Este archivo contiene los comportamientos de las consultas que haremos
    a la base de datos en la entidad 'comentarios'.
"""

from modules.database.querys.connection import get_connection

def new_comments(comment: str, id_product: int, id_user: int) -> bool:

    agora = get_connection()

    with agora.cursor() as cursor:
        cursor.execute("INSERT INTO comentarios(Comentario, ID_Producto, ID_Usuario) VALUES (%s, %s, %s)", (comment, id_product, id_user))
    
    agora.commit()
    agora.close()

    return True