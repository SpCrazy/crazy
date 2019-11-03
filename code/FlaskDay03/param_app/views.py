from flask import Blueprint, request, redirect, url_for, render_template

blue = Blueprint("myblue",__name__)


@blue.route("/args/", methods=["GET", "POST"])
def args_view():
    name = request.args.get("name")
    age = request.args.get("age")
    print("age的类型是：",type(age))
    return "<h3 style='color:blue'>接收到的name参数是：" + name + "；<br/>age是:" + age + "</h3>"

@blue.route("/form/",methods=["POST"])
def form_view():
    name = request.form.get("name")
    age = request.form.get("age")
    hobbies = request.form.getlist("hobby")
    print("age的类型是：",type(age))
    h = "；<br/>爱好是：" + hobbies[0] + "；另一个爱好是：" + hobbies[1]
    return "<h3 style='color:blue'>接收到的name参数是：" + name + "；<br/>age是:" + age + h +  "</h3>"


@blue.route('/goreg/')
def goreg_view():
    return render_template("register/register.html")


@blue.route("/register/",methods=["POST"])
def register_view():
    name = request.form.get("name")
    age = request.form.get("age")
    hobbies = request.form.getlist("hobby")
    print("age的类型是：",type(age))
    return  redirect(url_for("myblue.success_view",**locals()))


@blue.route("/suc/<name>/<age>/<hobbies>/")
def success_view(name,age,hobbies):
    list1 = hobbies.split("'")
    hobbies = []
    print(list1)
    return render_template('register/success.html',**locals())
