from flask import request
from flask_restful import Resource, fields, marshal_with, marshal

from restful_app.ext import db
from restful_app.models import Fruit

# 定制单个水果输出格式
output_fruit_fields = {
    "id":fields.Integer,
    "fruit_name":fields.String(attribute="name"),
    "price":fields.Float
}

# 定制GET查询单个水果输出格式化
output_fruit_info = {
    "code":fields.Integer,
    "msg":fields.String,
    "fruit":fields.Nested(output_fruit_fields)
}

#定制GET未查询到水果的格式化输出
output_noinfo = {
    "code":fields.Integer,
    "msg":fields.String
}


class FruitResource(Resource):
    @marshal_with(output_fruit_fields)
    def post(self):
        fruit_name = request.form.get("fruit_name")
        fruit_price = request.form.get("fruit_price")
        new_fruit = Fruit(name=fruit_name,price=fruit_price)
        db.session.add(new_fruit)
        db.session.commit()
        return new_fruit

    def get(self,fruit_id):
        fruit = Fruit.query.get(fruit_id)
        if fruit:
            data = {
                "code":200,
                "msg":"ok",
                "fruit":fruit
            }
            return marshal(data,output_fruit_info)
        else:
            data = {
                "code": 555,
                "msg": "未查到该水果",
            }
            return marshal(data,output_noinfo)