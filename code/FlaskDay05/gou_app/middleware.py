import random

from flask import request, g
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()


def load_middleware(app):

    @app.before_first_request
    def a():
        print("第一次请求before_first_request（）。。。")

    @app.before_request
    def b():
        ip = request.remote_addr
        print(ip+"发送了请求，before_request......")
        number = random.randint(1,10)
        if number >= 8:
            g.book = "《道德经》"
            return "<h3 style='color:blue'>恭喜，已中奖，你的IP是：" + ip + ":获取的随机数是：" + str(number) + "</h3>"
        g.book = "《学python，从入门到放弃》"


    @app.after_request
    def c(response):
        data = g.book
        print("after_request........,g.book=",data)
        return response


    @app.teardown_request
    def d(e):
        print("teardown_request......,e==",e)