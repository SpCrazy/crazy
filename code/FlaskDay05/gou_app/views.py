from flask import Blueprint, g

blue = Blueprint("myblue",__name__)

@blue.route("/index/")
def index():
    data = g.book
    return "<h3>我拿到书了:<span  style='color:red'>" + data + "</span></h3>"