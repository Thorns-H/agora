"""
    Este archivo contiene los comportamientos de las consultas que haremos
    a la base de datos en la entidad 'producto'.
"""

from modules.database.querys.connection import get_connection

def new_product(name: str, brand: str, description: str, image: str, price: float, category: str, status: str, stock: str, id_user: int, total_sales: str) -> bool:

    agora = get_connection()

    with agora.cursor() as cursor:
        cursor.execute("INSERT INTO producto(Nombre, Marca, Descripcion, Imagen, Precio, Categoria, Estatus, Existencias, ID_Usuarios, Ventas_Totales) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)", (name, brand, description, image, price, category, status, stock, id_user, total_sales))
    
    agora.commit()
    agora.close()

    return True