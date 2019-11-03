from flask import  Flask
from flask_script import Manager

app = Flask(__name__)
manager = Manager(app)  #关联程序实例与Manager对象

@app.route("/beauty/")
def beauty_view():
    return "<h3 style='color:blue'>Your are so beautiful</h3>"

@manager.command
def hansome():
    return  "这个小伙子很英俊"

if __name__ == '__main__':
    manager.run()