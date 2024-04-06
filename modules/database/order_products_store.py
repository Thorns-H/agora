"""
    Este archivo contiene los comportamientos de las consultas que haremos
    a la base de datos en la entidad 'orden_productos_negocio'.
"""

from modules.database.connection import get_connection

def new_order_products_store(issue_date: str, delivery_date: str, status: str, payment: str) -> bool:

    agora = get_connection()
   
    with agora.cursor() as cursor:
        cursor.execute("INSERT INTO orden_productos_negocio(Fecha_Emision, Fecha_Entrega, Estado, Pago) VALUES (%s, %s, %s, %s)", 
                       (issue_date, delivery_date, status, payment))
    
    agora.commit()
    agora.close()

    return True