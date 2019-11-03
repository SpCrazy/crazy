from flask import Flask

from param_app.views import blue


def create_app():
    #创建Flask实例
    app = Flask(__name__)
    #注册蓝图到程序实例
    app.register_blueprint(blue)
    return app
