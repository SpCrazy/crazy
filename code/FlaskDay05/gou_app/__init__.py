from flask import  Flask

from gou_app.middleware import load_middleware
from gou_app.views import blue


def create_app():
    app = Flask(__name__)
    load_middleware(app)
    app.register_blueprint(blue)

    return app
