import sys
sys.path.append(".")
from flask_script import Manager
from param_app import create_app

app = create_app()
manager = Manager(app)


if __name__ == '__main__':
    manager.run()
