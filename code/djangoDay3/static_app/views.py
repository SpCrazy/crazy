from django.shortcuts import render

def show_view(request):
    return render(request,'static_myapp/show_girl.html')
