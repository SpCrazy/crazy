from django.shortcuts import render
from django.http import HttpResponse

def helloView(request):  #视图函数的第一个参数代表请求对象，必须要有
    return HttpResponse("<h3 style='color:red'>Hello Django~~</h3>")


def hiView(request):
    return HttpResponse("<h3 style='color:cyan'>Hello World~~</h3>")


def greetView(request,food,drink,play):
    result = "<h3>嗨，今天吃的是" + food + "吗？喝得是" + drink + "吗？玩的是" + play + "</h3>"
    return HttpResponse(result)

def introduceView(request,name,age,hobby):
    result = "<h3>我叫" + name + "，今年" + str(age) + "岁，兴趣是" + hobby + "</h3>"
    return HttpResponse(result)

def convertView(request,name,age,uid):
    age += 2
    print("uid参数类型是：",type(uid),"uid=",uid)
    result = "<h3>我叫" + name + "，两年后" + str(age) + "岁了</h3>"
    return HttpResponse(result)

def converView01(request,info,name):
    result = "<h3>info:" + info + "；name：" + name + "</h3>"
    return HttpResponse(result)

def convertView02(request,comment):
    return HttpResponse("<h3>Have you uninstall these software</h3>")