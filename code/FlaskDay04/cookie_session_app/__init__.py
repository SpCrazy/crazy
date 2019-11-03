import datetime

import redis
from flask import Flask

from cookie_session_app.ext import init_ext
from cookie_session_app.views import cookie_blue, session_blue


def create_app():
    app = Flask(__name__)
    app.config["SECRET_KEY"] = "abcdefghijklmn"
    #配置SESSION类型，会自动把session数据保存到redis中
    app.config["SESSION_TYPE"] = "redis"
    app.config["SESSION_REDIS"] = redis.Redis(host="localhost",port=6379,password=123)
    app.config["SESSION_KEY_PREFIX"] = "python1902"
    app.config["PERMANENT_SESSION_LIFETIME"] = datetime.timedelta(seconds=30)
    app.register_blueprint(cookie_blue)
    app.register_blueprint(session_blue)
    init_ext(app)
    return app


