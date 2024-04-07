"""
    Este archivo contiene los comportamientos de las consultas que haremos
    a la base de datos en la entidad 'direccion'.
"""

from modules.database.querys.connection import get_connection

def new_address(street: str, number: str, neighborhood: str, postal_code: str, city: str, ID_user: int) -> bool:

    agora = get_connection()

    with agora.cursor() as cursor:
        cursor.execute("INSERT INTO direccion(Calle, Numero, Colonia, Codigo_Postal, Ciudad, ID_Usuario) VALUES (%s, %s, %s, %s, %s, %s)", (street, number, neighborhood, postal_code, city, ID_user))
    
    agora.commit()
    agora.close()

    return True