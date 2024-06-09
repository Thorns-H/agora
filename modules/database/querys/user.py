"""
    Este archivo contiene los comportamientos de las consultas que haremos
    a la base de datos en la entidad 'usuario'.
"""

from modules.database.connection import get_connection

def get_user(email: str) -> tuple:
    agora = get_connection()

    with agora.cursor() as cursor:
        cursor.execute(f"SELECT * FROM usuario WHERE Correo_Electronico = '{email}'")
        user = cursor.fetchone()

    agora.close()

    return user

def new_user(name: str, email: str, phone: str, password: str) -> bool:

    agora = get_connection()

    with agora.cursor() as cursor:
        cursor.execute(f"SELECT COUNT(*) FROM usuario WHERE Correo_Electronico = '{email}'")

    if len(phone) != 10 or cursor.fetchone()[0] > 0:
        agora.close()
        return False
    
    with agora.cursor() as cursor:
        cursor.execute("INSERT INTO usuario(Nombre, Correo_Electronico, Telefono, Contraseña) VALUES (%s, %s, %s, %s)", (name, email, phone, password))
    
    agora.commit()
    agora.close()

    return True