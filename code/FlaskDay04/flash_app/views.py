from flask import Blueprint, request, render_template, session, redirect, url_for, flash

blue = Blueprint("myblue",__name__)


@blue.route("/login/",methods=["GET","POST"])
def login_view():
    if request.method == "GET":
        return  render_template("login_template/login.html")
    elif request.method == "POST":
        logname = request.form.get("regname")
        logpwd = request.form.get("regpwd")
        if logname == "tom" and logpwd == "123":
            session["username"] = logname
            return redirect(url_for('myblue.welcome_view'))
        else:
            flash("用户名或者密码错误，请重新登录！")
            return redirect(url_for("myblue.login_view"))


@blue.route("/welcome/")
def welcome_view():
    if not session.get("username"):
        flash("您还未登录，请先登录！！！")
        return redirect(url_for("myblue.login_view"))
    return render_template('login_template/welcome.html')


@blue.route("/sessions/")
def sessions_data():
    sessions = session.items()
    html = ""
    for k,v in sessions:
        html += k
        html += "---->"
        html += str(v)
        html += "<br / >"
    return html