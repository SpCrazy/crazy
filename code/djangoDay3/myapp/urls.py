from django.contrib import admin
from django.urls import path

from myapp.views import *

app_name = "myapp"

urlpatterns = [
    path('register/',registerView,name="reg"),
    path('success/<userName>',success_view,name="suc"),
    path('goa/<stuname>/<stuage>/', go_a),
    path('handle/<name>/<age>/',handler_a,name='handle'),
]
