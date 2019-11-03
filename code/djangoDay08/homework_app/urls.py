from django.urls import path

from homework_app.views import *

app_name = "homework_app"

urlpatterns = [
    path('login/',login_view,name="log"),
    path('fruit/buy/',fruit_view,name="buy"),
    path('fruit/cart/',fruit_view,name="cart"),

]
