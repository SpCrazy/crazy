from flask import Blueprint, render_template, current_app

blue = Blueprint("myblue",__name__)


@blue.route("/go/")
def go_config():
    return render_template('config/config_demo.html')


@blue.route("/show/")
def show_config_view():
    html = ""
    for k,v in current_app.config.items():
        html += k
        html += "----->"
        html += str(v)
        html += "<br />"
    return html