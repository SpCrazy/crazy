from django.contrib.auth import authenticate, login
from django.shortcuts import render, redirect
from django.urls import reverse


def login_view(request):
    if request.method == "GET":
        return render(request,'homework_app/login.html')
    elif request.method == "POST":
        logname = request.POST.get("username")
        logpwd = request.POST.get("pwd")
        user = authenticate(username=logname,password=logpwd)
        if user is not None:
            login(request,user)
            return redirect(reverse("homework:buy"))
        return redirect(reverse("homework:log"))

def fruit_view(request):
    return render(request,'homework_app/fruit.html')