"""
    Este archivo contiene la ruta principal de nuestra aplicación.
"""

from flask import Blueprint, render_template

indexbp = Blueprint('index', __name__)

@indexbp.route('/')
def index():
    return render_template('index.html')