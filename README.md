# 💻 Agora Market

**Agora** es un software de e-commerce desarrollado para sustentar las necesidades de los estudiantes
dentro de la universidad, siguiendo una implementación de compra y venta de productos en tiempo real además de la
ayuda de inteligencia artificial.

## Instalación
* Crea una copia del repositorio y instala los requerimientos de software.
```
git clone https://github.com/Thorns-H/agora && cd agora
pip install -r requirements.txt && touch .env
```
* Configura el archivo .env que acabas de crear con tu información.
```
DB_USER = YOUR_USER
DB_PASSWORD = YOUR_PASSWORD
DB_NAME = YOUR_DATABASE
FLASK_SECRET_KEY = YOUR_FLASK_KEY
```
La información que uses aquí es la misma con la que usas tu gestor de base de datos y la clave secreta de flask debe ser única
si quieres correr el proyecto y mantener las sesiones funcionando correctamente.

## Software

Esta lista probablemente irá creciendo con el tiempo que me mantenga trabajando en este proyecto pero aquí hay una lista detallada:
* **Lenguajes:** Python, HTML5, CSS, JS.
* **Framework(s):**
  - [Flask](https://flask.palletsprojects.com/en/2.2.x/) Version 2.3.2.
  - [Bootstrap](https://getbootstrap.com/).
* **Librerías:**
  - [PyMySQL](https://pymysql.readthedocs.io/en/latest/).
  - [python-dotenv](https://pypi.org/project/python-dotenv/).
* **Base de Datos:**
  - [MariaDB](https://mariadb.org/) Ver 15.1 Distrib 10.6.12.
