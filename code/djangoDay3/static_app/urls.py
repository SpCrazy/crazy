from django.contrib import admin
from django.urls import path

from static_app.views import *

app_name = "myapp"

urlpatterns = [
    path('girl/',show_view)
]
