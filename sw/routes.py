from flask import request, render_template, redirect, url_for, flash
from flask_login import login_user, login_required, logout_user

from sw.models import User
from sw import app, db
from werkzeug.security import check_password_hash, generate_password_hash


@app.route('/main', methods=['GET'])
@login_required
def main():
    return render_template('success.html')

@app.route('/')
def index():
    return render_template('index.html')


@app.route('/login', methods=['POST', 'GET'])
def login_page():
    username = request.form.get('login')
    password = request.form.get('password')

    if username and password:
        user = User.query.filter_by(username=username).first()
        if user and check_password_hash(user.password, password):
            login_user(user)
            next_page = request.args.get('next')
            return redirect(url_for('main'))
        else:
            flash('Логин или пароль неверный')
    else:
        flash('Пожалуйста, заполните поля логин и пароль')

    return render_template('login.html')

@app.route('/register', methods=['POST', 'GET'])
def register():
    username = request.form.get('login')
    password = request.form.get('password')
    password2 = request.form.get('password2')
    if request.method == 'POST':
        if not (username or password or password2):
            flash('Пожалуйста, заполните все поля!')
        elif password != password2:
            flash('Пароли не совпадают!')
        elif not User.query.filter(User.username == request.form['login']).all():
            hash_pwd = generate_password_hash(password)
            new_user = User(username=username, password=hash_pwd)
            db.session.add(new_user)
            db.session.commit()
            return redirect(url_for('login_page'))

        else: flash('Пользователь уже существует!')

    return render_template('register.html')

@app.route('/logout', methods=['POST', 'GET'])
@login_required
def logout():
    logout_user()
    return redirect(url_for('login_page'))

@app.after_request
def redirect_to_signin(response):
    if response.status_code == 401:
        return redirect(url_for('login_page') + '?next=' + request.url)

    return response

