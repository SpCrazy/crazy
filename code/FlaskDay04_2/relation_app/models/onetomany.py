from relation_app.ext import db


class School(db.Model):   # "一方"
    __tablename__ = "schools"
    id = db.Column(db.Integer,primary_key=True,autoincrement=True)
    name = db.Column(db.String(20),nullable=False)
    address = db.Column(db.String(50))
    students = db.relationship("Student",backref="sch") # 关联学生模型，并设置反向引用名称



class Student(db.Model):
    __tablename__ = "students"
    id = db.Column(db.Integer,primary_key=True,autoincrement=True)
    name = db.Column(db.String(20),nullable=False)
    score = db.Column(db.Float,nullable=False)
    school_id = db.Column(db.Integer,db.ForeignKey("schools.id"),nullable=False)
