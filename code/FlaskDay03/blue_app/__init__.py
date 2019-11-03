from flask import Flask

from blue_app.views import music_blue, sport_blue


def create_app():
    #创建Flask实例
    app = Flask(__name__)
    #注册蓝图到程序实例
    app.register_blueprint(music_blue)
    app.register_blueprint(sport_blue)
    return app
