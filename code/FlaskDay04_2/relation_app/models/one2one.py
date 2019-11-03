from relation_app.ext import db


class Person(db.Model):
    __tablename__ = "person"
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(20), nullable=False)
    card = db.relationship("Card",backref="per",uselist=False)


class Card(db.Model):
    __tablename__ = "card"
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    cardno = db.Column(db.String(20),unique=True)
    person_id = db.Column(db.Integecr,db.ForeignKey("person.id"),unique=True)