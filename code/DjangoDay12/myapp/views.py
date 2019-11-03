from django.shortcuts import render, redirect
from django.urls import reverse


def login_view(request):
    if request.method == "GET":
        return  render(request,"myapp/login.html")
    elif request.method == "POST":
        name = request.POST.get("username")
        pwd = request.POST.get("pwd")
        if name == "tom" and pwd == "123456":
            request.session["username"] = name
            return redirect(reverse("myapp:suc"))
        else:
            return redirect(reverse('myapp:log'))
def success_view(request):
    return render(request,'myapp/success.html')
