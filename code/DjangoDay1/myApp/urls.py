from django.contrib import admin
from django.urls import path,re_path

from myApp.views import *

urlpatterns = [
    path('hello/',helloView),
    path('greet/<food>/<drink>/',greetView,{"play":"乒乓球"}),
    path('convert/<str:name>/<int:age>/<uuid:uid>/',convertView),
    path('convert1/<path:info>/<str:name>/',converView01),
    path('convert2/<slug:comment>/',convertView02),
    re_path(r'^hi/&',hiView),
    re_path(r'intro/(?P<name>\w+)/$',introduceView,{"age":22,"hobby":"学习"})
]
