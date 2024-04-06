"""
    Este archivo contiene los comportamientos de las consultas que haremos
    a la base de datos en la entidad 'Reputacion.
"""

from modules.database.connection import get_connection

def new_reputation(ID_user: int, rating: int, comment: str, date: str, name: str) -> bool:

    agora = get_connection()
   
    with agora.cursor() as cursor:
        cursor.execute("INSERT INTO reputacion(ID_Usuario, Calificacion, Comentario, Fecha, Nombre) VALUES (%s, %s, %s, %s, %s)", 
                       (ID_user, rating, comment, date, name))
    
    agora.commit()
    agora.close()

    return True