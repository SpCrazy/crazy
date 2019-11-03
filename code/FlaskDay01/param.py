from flask import Flask

app = Flask(__name__)

@app.route("/greet/<name>/<int:age>/")
def greet_view(name,age):
    age += 1
    return "<h3>我叫" + name + ",明年" + str(age) + "岁</h3>"

if __name__ == '__main__':
    app.run(debug=True)