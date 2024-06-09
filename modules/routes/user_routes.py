"""
    Este archivo contiene las rutas de todo lo relacionado a los usuarios y
    su entidad en la base de datos.
"""

from flask import Blueprint, render_template, request, redirect, session, flash, url_for
import bcrypt

from modules.database.querys.user import new_user, get_user

from modules.database.models.models import User

loginbp = Blueprint('login', __name__)
registerbp = Blueprint('register', __name__)
logoutbp = Blueprint('logout', __name__)
profilebp = Blueprint('profile', __name__)

@loginbp.route('/login', methods = ['GET', 'POST'])
def login():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']

        user = User(get_user(email = email))

        if bcrypt.checkpw(password.encode('utf-8'), user.password.encode('utf-8')):
            session['user'] = {
                'id': user.id,
                'name': user.name,
                'email': user.email,
                'phone': user.phone,
                'description': user.description,
                'profile_pic': user.profile_picture
            }

            return redirect('/')
        
        flash('Ha habido un error, intentalo de nuevo.')
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
        

        salt = bcrypt.gensalt()

        password = bcrypt.hashpw(request.form['password'].encode('utf-8'), salt)
        confirm_password = bcrypt.hashpw(request.form['confirm_password'].encode('utf-8'), salt)

        if not bcrypt.checkpw(password, confirm_password):
            flash('Las contraseñas no coinciden!')
            redirect('/register')
        
        if not new_user(name = name, email = email, phone = phone, password = password):
            return redirect('/register')

        return redirect('/login')
    else:
        return render_template('register.html')
    
@logoutbp.route('/logout')
def logout():
    for key in list(session.keys()):
        session.pop(key)

    return redirect('/')

@profilebp.route('/profile', methods = ['GET', 'POST'])
def profile():
    return render_template('profile.html')