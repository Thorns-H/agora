"""
    Este archivo contiene los comportamientos de las consultas que haremos
    a la base de datos en la entidad 'productos_carrito'.
"""

from modules.database.connection import get_connection

def new_shopping_cart(quantity: int, ID_product: int, ID_user: int) -> bool:

    agora = get_connection()
   
    with agora.cursor() as cursor:
        cursor.execute("INSERT INTO productos_carrito(Cantidad, ID_Producto, ID_Usuario) VALUES (%s, %s, %s)", 
                       (quantity, ID_product, ID_user))
    
    agora.commit()
    agora.close()

    return True