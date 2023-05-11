from flask_login import UserMixin

from sw import db, log_manager


class User(db.Model, UserMixin):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(128), nullable=False, unique=True)
    password = db.Column(db.String(255), nullable=False)

    # def __repr__(self):
    #     return '<User %r>' % self.username

@log_manager.user_loader
def load_user(user_id):
    return User.query.get(user_id)
