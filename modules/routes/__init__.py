from flask import Blueprint

from .index_route import indexbp

routes_bp = Blueprint('routes', __name__)

routes_bp.register_blueprint(indexbp)