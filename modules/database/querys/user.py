"""
    Este archivo contiene los comportamientos de las consultas que haremos
    a la base de datos en la entidad 'usuario'.
"""

from modules.database.querys.connection import get_connection

# Implementación de datos de usuario por medio de id, más recomendado una vez este logeado.

def get_user_by_id(user_id: int) -> tuple:
    agora = get_connection()

    with agora.cursor() as cursor:
        cursor.execute(f"SELECT * FROM usuario WHERE ID = '{id}'")
        user = cursor.fetchone()

    agora.close()

    return user

# Implementación de datos de usuario por medio del correo, solo se debe usar cuando se va a logear.

def get_user(email: str) -> tuple:
    agora = get_connection()

    with agora.cursor() as cursor:
        cursor.execute(f"SELECT * FROM usuario WHERE Correo_Electronico = '{email}'")
        user = cursor.fetchone()

    agora.close()

    return user

# Implementación de la creación de un usuario nuevo, solo se debe usar después de haber validado los datos.

def new_user(name: str, email: str, phone: str, password: str, gender: str) -> bool:

    agora = get_connection()

    with agora.cursor() as cursor:
        cursor.execute(f"SELECT COUNT(*) FROM usuario WHERE Correo_Electronico = '{email}'")

    if len(phone) != 10 or cursor.fetchone()[0] > 0:
        agora.close()
        return False
    
    with agora.cursor() as cursor:
        cursor.execute("INSERT INTO usuario(Nombre, Correo_Electronico, Telefono, Contraseña, Genero) VALUES (%s, %s, %s, %s, %s)", (name, email, phone, password, gender))
    
    agora.commit()
    agora.close()

    return True