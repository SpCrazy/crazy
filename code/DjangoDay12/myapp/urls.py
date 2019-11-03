from django.urls import path

from myapp.views import *

app_name = "myapp"

urlpatterns = [
    path('login/',login_view,name="log"),
    path('success/',success_view,name="suc"),

]
