from django.urls import path
from rest_framework.routers import SimpleRouter
from orders.views import *

order_router = SimpleRouter()
order_router.register(r"order", OrderViewSet)


urlpatterns = [
    path('orderpay/', OrderPayView.as_view()),
    path('checkpay/', CheckPayView.as_view()),

]

urlpatterns += order_router.urls
