from flask import Flask, url_for
from flask_sqlalchemy import SQLAlchemy
from flask_login import LoginManager

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:root@localhost/users'
app.secret_key = 'qwqeqe1131'
db = SQLAlchemy(app)
log_manager = LoginManager(app)

from sw import routes