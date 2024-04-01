"""
    Este archivo contiene los comportamientos de las consultas que haremos
    a la base de datos en la entidad 'usuario'.
"""

from connection import get_connection

def new_user(name: str, email: str, cellphone: str, address: str, password: str) -> bool:

    agora = get_connection()

    with agora.cursor() as cursor:
        cursor.execute(f"SELECT COUNT(*) FROM usuario WHERE Correo_Electronico = '{email}'")

    if len(cellphone) != 10 or cursor.fetchone()[0] > 0:
        agora.close()
        return False
    
    with agora.cursor() as cursor:
        cursor.execute("INSERT INTO usuario(Nombre, Correo_Electronico, Telefono, Contrasena) VALUES (%s, %s, %s, %s, %s)", (name, email, cellphone, address, password))
    
    agora.commit()
    agora.close()

    return True