"""
    Este archivo contiene las rutas de todo lo relacionado a los usuarios y
    su entidad en la base de datos.
"""

from flask import Blueprint, render_template

loginbp = Blueprint('login', __name__)
registerbp = Blueprint('register', __name__)

@loginbp.route('/login')
def login():
    return render_template('login.html')

@registerbp.route('/register')
def register():
    return render_template('register.html')