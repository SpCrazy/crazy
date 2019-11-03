from rest_app.ext import db


class Fruit(db.Model):
    __tablename__ = "fruits"
    id = db.Column(db.Integer,primary_key=True,autoincrement=True)
    name = db.Column(db.String(20),nullable=False,unique=True)
    price = db.Column(db.Float,nullable=False)


class Student(db.Model):
    __tablename__ = "students"
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(20), nullable=False, unique=True)
    score = db.Column(db.Float, nullable=False)