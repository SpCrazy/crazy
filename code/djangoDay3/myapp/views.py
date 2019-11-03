from django.http import HttpResponse
from django.shortcuts import render, redirect
import pymysql
from django.urls import reverse


def go_a(request,stuname,stuage):
    return render(request,'myapp/a_href.html',locals())

def handler_a(request,name,age):
    return HttpResponse("<h3>这就是URL反向解析,name:" + name + ";age:" + age +"</h3>")

def get_conn():
    conn = pymysql.connect(
        host = "localhost",
        port = 3306,
        user = "root",
        password = "930214",
        db = "myku",
        charset = "utf8"
    )
    return conn

def registerView(request):
    if request.method == "GET":
        return render(request,'myapp/register.html')
    elif request.method == "POST":
        userName = request.POST.get("user")
        userPwd = request.POST.get("pwd")

        conn = get_conn()
        cursor = conn.cursor()
        sql = "insert into user(name,password) values(%s,%s)"
        try:
            cursor.execute(sql,(userName,userPwd))
            conn.commit()
            return redirect(reverse("myapp:suc",args=(userName,)))
        except Exception as e:
            print("注册失败，失败原因为：",e)
            conn.rollback()
            return redirect("myapp:reg")
        finally:
            cursor.close()
            conn.close()

def success_view(request,userName):
    return render(request,'myapp/success.html',locals())