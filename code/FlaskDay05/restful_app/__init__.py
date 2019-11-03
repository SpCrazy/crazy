from flask import Flask
from restful_app.api import init_api
from restful_app.ext import init_ext


def create_app():
    app = Flask(__name__)
    app.config["SQLALCHEMY_DATABASE_URI"] = "mysql+pymysql://root:930214@localhost:3306/myku?charset=utf8"
    app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
    init_ext(app)
    init_api(app)
    return app