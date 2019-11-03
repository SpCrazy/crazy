from flask import Blueprint, g

limit_blue = Blueprint('limitblue',__name__)


@limit_blue.route('/limit/')
def limit_view():
    count = g.visit_count
    return  "<h3>恭喜，可以访问，这是你第<span style='color:blue'>" + str(count) + "</span>次访问</h3>"


