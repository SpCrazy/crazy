from flask_restful import Api

from rest_app.resource import FruitResource
from rest_app.student_resource import StudentResource

api = Api()

def init_api(app):
    api.init_app(app)


api.add_resource(FruitResource,"/fruits/")
api.add_resource(StudentResource,"/student/")