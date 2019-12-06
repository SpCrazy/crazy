from rest_framework.routers import SimpleRouter
from django.urls import path

from goods.views import home_view

urlpatterns = [
    path('home/',home_view)
]


