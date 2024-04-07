"""
    Este archivo es la inicialización para las rutas de nuestra aplicación.
"""

from flask import Blueprint

"""
    Por cada ruta, deben crear un archivo .py relacionado y importar
    las rutas.
"""

from .index_route import indexbp
from .user_routes import loginbp, registerbp, logoutbp, profilebp

routes_bp = Blueprint('routes', __name__)

"""
    Una vez importado las rutas, debemos agregarlo a la ruta principal
    como un registro.
"""

routes_bp.register_blueprint(indexbp)

routes_bp.register_blueprint(loginbp)
routes_bp.register_blueprint(registerbp)
routes_bp.register_blueprint(logoutbp)
routes_bp.register_blueprint(profilebp)