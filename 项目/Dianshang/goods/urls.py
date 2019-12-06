from django.urls import path
from rest_framework.routers import SimpleRouter

from goods.views import *

goods_router = SimpleRouter()
goods_router.register(r"xq",MarketViewSet)
goods_router.register(r"ltype",ShowLeftViewSet)
goods_router.register(r"type",ProductTypeViewSet)

urlpatterns = [
    path("home/",home_view)
]

urlpatterns += goods_router.urls