from flask import Blueprint, session

session_blue = Blueprint("sessionblue",__name__)

@session_blue.route("/addsession/")
def add_session_view():
    session["username"] = "tom"
    session['password'] = "123456"
    session['email'] = "tom@163.com"
    return "session数据添加完毕"

@session_blue.route("/pop/<name>/")
def pop_session_view(name):
    value = session.pop(name,"Session中已经无此属性")
    return "弹出的session属性值为" + value


@session_blue.route("/session/<name>/")
def session_value(name):
    value = session.get(name,"无此session属性")
    return "session的属性名为" + name + "；属性值为：" + value


@session_blue.route("/clear/")
def session_clear():
    session.clear()
    return "session已经清空！"

@session_blue.route("/sessions/")
def sessions_data():
    sessions = session.items()
    html = ""
    for k,v in sessions:
        html += k
        html += "---->"
        html += v
        html += "<br / >"
    return html