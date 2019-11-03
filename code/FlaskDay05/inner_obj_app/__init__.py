from flask import Flask

from inner_obj_app.views import blue


def create_app():
    app = Flask(__name__)
    app.register_blueprint(blue)
    app.config["country"] = "China"
    app.config["color"] = "red"
    app.config["food"] = "rice"

    return app