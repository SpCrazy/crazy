from flask_restful import Resource, marshal_with, fields

from rest_app.models import Fruit

output_fruit = {
    "fruit_id":fields.Integer(attribute="id"),
    "fruit_name":fields.String(attribute="name"),
    "fruit_price":fields.String(attribute="price"),
    "note":fields.String(default="又大又好吃的水果，请品尝~~~~")
}

output_many_fruits = {
    "code":fields.Integer,
    "msg":fields.String,
    #方法一：
    "fruits":fields.List(fields.Nested(output_fruit))
    #方法二：
    # "fruits":fields.Nested(output_fruit)
}

class FruitResource(Resource):
    @marshal_with(output_many_fruits)
    def get(self):
        fruits = Fruit.query.all()
        result = {
            "code":200,
            "msg":"ok",
            "fruits":fruits
        }
        return result


