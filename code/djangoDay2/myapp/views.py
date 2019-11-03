from django.http import JsonResponse
from django.shortcuts import render

def jsonObjView(request):
    data = {"name":"xiaodu","age":23,"sex":"man"}
    return JsonResponse(data)


def jsonObjView1(request):
    data = [{
        "name": "alice",
        "age": 22,
        "sex": "girl"
    }, {
        "name": "lili",
        "age": 25,
        "sex": "girl"
    }]
    return JsonResponse(data,safe=False)

class Student():
    def __init__(self,name,age):
        self.name = name
        self.age = age

    def say(self):
        return "我叫" + self.name + "；今年" + str(self.age) + "了"

def varView(request):
    stu = Student("jack",25)
    mydict = {"color":"red","country":"China"}
    fruits = ["apple","banana","orange","watermelon"]
    print("locals=",locals())
    return render(request,"myapp/var/showVariable.html",locals())
