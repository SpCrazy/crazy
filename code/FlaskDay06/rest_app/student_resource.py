from flask_restful import Resource, fields, marshal_with
from flask_restful.reqparse import RequestParser

from rest_app.models import *

req_post = RequestParser()  #实例化一个RequestParser对象
req_post.add_argument("name",required=True,help="name参数必须输入~~~~~~",dest="stuname") # 添加参数验证规则
req_post.add_argument("stuscore",required=True,type=float,help="成绩必须输入，而且为数字",dest="score")

output_student = {
    "id":fields.Integer,
    "name":fields.String,
    "score":fields.Float
}

output_student_msg = {
    "code":fields.String,
    "msg":fields.String,
    "student":fields.Nested(output_student)
}
class StudentResource(Resource):
    @marshal_with(output_student_msg)
    def  post(self):
        print("post......")
        args = req_post.parse_args()
        print("args====",args)
        stuname = args.get("stuname")
        score = args.get("score")
        new_student = Student(name=stuname,score=score)
        db.session.add(new_student)
        db.session.commit()
        data = {
            "code":200,
            "msg":"新生添加成功",
            "student":new_student
        }
        return data