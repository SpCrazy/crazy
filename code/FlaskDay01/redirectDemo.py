from flask import Flask, redirect, url_for
from flask_script import Manager

app = Flask(__name__)
manager = Manager(app)

@app.route('/smart/<name>/')
def smart_view(name):
    print("smart_view()..........")
    return redirect(url_for("nice_view",nick=name))

@app.route('/nice/<nick>')
def nice_view(nick):
    return "<h3 style='color:green'>" + nick +",你真nice....</h3>"


if __name__ == '__main__':
    manager.run()