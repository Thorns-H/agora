"""
    Este es el archivo principal de la aplicación, recuerden no compartir datos sensibles
    en este apartado, recomiendo usar .env en todo momento.
"""

from flask import Flask
import os
from dotenv import load_dotenv

if __name__ == '__main__':

    load_dotenv()

    app = Flask(__name__)
    app.secret_key = os.getenv("FLASK_SECRET_KEY")

    """
        El parámetro de host en 0.0.0.0 hará que puedan ver el render de las rutas de la
        página desde la ip de su máquina, pueden probarlo con su celular u otra máquina
        siempre que esten conectados en la misma red.

        También recuersen hacerlo usando https y no http.

        Ejemplo: https://192.168.100.10:5050

        Si quieren cambiar el protocolo de https a http, solo quiten ssl_context como parámetro.
    """

    app.run(host = '0.0.0.0', port = 5050, ssl_context='adhoc')