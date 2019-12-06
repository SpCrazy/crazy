from rest_framework.routers import SimpleRouter

from carts.views import CartViewSet

carts_router = SimpleRouter()
carts_router.register(r"cart",CartViewSet)