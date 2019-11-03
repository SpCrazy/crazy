from  flask import Flask

from limit_app.middleware import load_middleware
from limit_app.views import limit_blue


def create_app():
    app = Flask(__name__)
    load_middleware(app)
    app.register_blueprint(limit_blue)

    return app