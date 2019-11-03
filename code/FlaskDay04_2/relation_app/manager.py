import sys
sys.path.append(".")
from flask_migrate import Migrate, MigrateCommand
from relation_app import create_app
from relation_app.ext import db
from flask_script import Manager
from relation_app.models import *



app = create_app()
Migrate(app,db)
manager = Manager(app)
manager.add_command("nicedb",MigrateCommand)

if __name__ == '__main__':
    manager.run()