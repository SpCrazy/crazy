import sys
sys.path.append(".")
from flask_migrate import Migrate, MigrateCommand
from flask_script import Manager

from restful_app import create_app
from restful_app.models import *

app = create_app()
Migrate(app,db)
manager = Manager(app)
manager.add_command("nicedb",MigrateCommand)



if __name__ == '__main__':
    manager.run()