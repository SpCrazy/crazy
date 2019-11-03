from django.urls import path

from myapp.views import *

urlpatterns = [
    path('json1/',jsonObjView),
    path('json2/',jsonObjView1),
    path('var/',varView),
]