from flask import  Blueprint

sport_blue = Blueprint('sportblue',__name__)


@sport_blue.route("/jog/")
def jog_view():
    return "<h3 style='color:pink'>慢跑-_-_-_-_-</h3>"


@sport_blue.route("/ping/")
def ping_view():
    return "<h3 style='color:cyan'>打乒乓球-_-_-_-_-</h3>"