from flask import Flask, jsonify

app = Flask(__name__)


@app.route("/jsonobj/")
def json_obj_view():
    mydict = {
        "name": "tom",
        "age": 20,
        "sex": "男"
    }
    return jsonify(mydict)

@app.route("/jsonarray/")
def json_array_view():
    fruits = ["apple","orange","banana"]
    return jsonify(fruits)


@app.route("/jsontest/")
def json_test_view():
    return jsonify(name="杜询",age=25,sex="女")