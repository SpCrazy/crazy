from flask import Blueprint, make_response, request

cookie_blue = Blueprint("cookieblue",__name__)


@cookie_blue.route("/addcookie/")
def add_cookie_view():
    response = make_response("Cookie创建完毕！")
    response.set_cookie("fruit","apple",max_age=60)
    response.set_cookie("sport","football")
    return response


@cookie_blue.route("/delcookie/<name>/")
def del_cookie_view(name):
    response = make_response("名称为" + name + "的Cookie已经删除")
    response.delete_cookie(name)
    return response

@cookie_blue.route("/cookie/<name>/")
def get_cookie_view(name):
    cookie_value = request.cookies.get(name,"没有该Cookie")
    return "名称为" + name + "的Cookie值为：" + cookie_value

@cookie_blue.route("/cookies/")
def get_all_cookie():
    cookies = request.cookies
    html = ""
    for k,v in cookies.items():
        html += k
        html += "--->"
        html += v
        html += "<br/>"
    return html