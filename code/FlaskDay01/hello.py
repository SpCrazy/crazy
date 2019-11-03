from flask import Flask

app = Flask(__name__)    #创建Flask程序实例

@app.route("/hello/")
def hello_view():
    return "<h3 style='color:blue'>Hello Flask!</h3>"

@app.route("/hi/")
def hi_view():
    return "<h3 style='color:red'>Hi,大家好啊~~~~</h3>"

if __name__ == '__main__':
    app.run()