from flask import Flask
from flask_script import Manager

from template_app.views import app

manager = Manager(app)

if __name__ == '__main__':
    manager.run()
