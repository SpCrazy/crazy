from flask import Flask, render_template
from flask_script import Manager

app = Flask(__name__)
manager = Manager(app)

@app.route("/fruits/")
def fruits_view():
    fruits = ['苹果',"香蕉",'橘子','菠萝']
    info = "水果页面"
    return render_template('fruits.html',**locals())

if __name__ == '__main__':
    manager.run()