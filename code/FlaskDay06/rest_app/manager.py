import sys
sys.path.append(".")
from rest_app import create_app
from rest_app.models import *
from flask_migrate import Migrate, MigrateCommand
from flask_script import Manager



app = create_app()
Migrate(app,db)
manager = Manager(app)
manager.add_command("nicedb",MigrateCommand)


if __name__ == '__main__':
    manager.run()