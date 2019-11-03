from sqlalchemy_app.ext import db


class Student(db.Model):
    __tablename__ = "students"
    id = db.Column(db.Integer,primary_key=True,autoincrement=True)
    name = db.Column(db.String(20),nullable=False)
    score = db.Column(db.Float,nullable=False)