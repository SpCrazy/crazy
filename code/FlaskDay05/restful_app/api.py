from flask_restful import Api

from restful_app.resource import FruitResource

api = Api()

def init_api(app):
    api.init_app(app)


api.add_resource(FruitResource,"/fruit/","/fruit/<int:fruit_id>/")