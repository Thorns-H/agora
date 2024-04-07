"""
    Este archivo contiene los comportamientos de las consultas que haremos
    a la base de datos en la entidad 'orden_productos_envio'.
"""

from modules.database.querys.connection import get_connection

def new_order_products_shipping(ID_cart: int, ID_address: int, issue_date: str, delivery_date: str, status: str, payment: str, shipping_cost: int) -> bool:

    agora = get_connection()

    with agora.cursor() as cursor:
        cursor.execute("INSERT INTO orden_productos_envio(ID_Carrito, ID_Direccion, Fecha_Emision, Fecha_Entrega, Estado, Pago, Precio_Envio) VALUES (%s, %s, %s, %s, %s, %s, %s)", (ID_cart, ID_address, issue_date, delivery_date, status, payment, shipping_cost))
    
    agora.commit()
    agora.close()

    return True