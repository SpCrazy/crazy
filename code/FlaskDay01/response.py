from flask import Flask, make_response
from flask_script import Manager

app = Flask(__name__)
manager = Manager(app)


@app.route('/nice/')
def nice_view():
    return "<h3 style='color:purple'>You are so nice...</h3>"

@app.route('/addcookie/')
def add_cookie():
    response = make_response("<h3 style='color:red'>Cookie信息设置成功！</h3>")
    response.set_cookie("fruit", "orange", 30)
    response.headers['enviromental_pollution'] = "it is so series"
    response.headers['Content-Type'] = "text/plain; charset=utf-8"
    return response


if __name__ == '__main__':
    manager.run()