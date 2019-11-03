from flask import Flask, render_template

app = Flask(__name__)


@app.route("/child/")
def child_view():
    return render_template("extends/child.html")


@app.route('/filter/')
def filter_view():
    s = "hElLo FlaSK"
    mydict = {"name":"wangchong","age":27}
    numbers = [1,2,3,4]
    danger = "<script>alert('王冲是个大笨蛋！')</script>"
    return render_template("filter/filter_demo.html",**locals())

@app.route('/macro/')
def macro_view():
    fruits = ["苹果","菠萝","香蕉","猕猴桃"]
    return render_template("macro/call_macro.html",fruits=fruits)