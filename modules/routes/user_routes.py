"""
    Este archivo contiene las rutas de todo lo relacionado a los usuarios y
    su entidad en la base de datos.
"""

from flask import Blueprint, render_template, request, redirect, session
import hashlib

from modules.database.user import new_user, get_user

loginbp = Blueprint('login', __name__)
registerbp = Blueprint('register', __name__)

@loginbp.route('/login', methods = ['GET', 'POST'])
def login():
    if request.method == 'POST':
        email = request.form['email']
        password = hashlib.md5(request.form['password'].encode()).hexdigest()

        user_info = get_user(email = email)
        user_password = user_info[4]

        if password == user_password:
            session['user'] = {
                'id': user_info[0],
                'name': user_info[1],
                'email': user_info[2],
                'phone': user_info[3],
                'gender': user_info[5]
            }

            return redirect('/')
        
        return render_template('login.html')
    else:
        return render_template('login.html')
    
# TODO: Necesitamos implementar la lógica de validar el correo, de formato al nombre y al telefono.

@registerbp.route('/register', methods = ['GET', 'POST'])
def register():
    if request.method == 'POST':
        name = request.form['name']
        email = request.form['email']
        phone = request.form['phone']
        gender = request.form['gender']
        password = hashlib.md5(request.form['password'].encode()).hexdigest()
        confirm_password = hashlib.md5(request.form['confirm_password'].encode()).hexdigest()

        if password != confirm_password:
            return
        
        if not new_user(name = name, email = email, phone = phone, gender = gender, password = password):
            return redirect('/register')

        return redirect('/login')
    else:
        return render_template('register.html')