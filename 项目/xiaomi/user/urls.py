from rest_framework.routers import SimpleRouter

from user.views import UserViewSet, AddressViewSet

user_router = SimpleRouter()
user_router.register(r"auth",UserViewSet)
user_router.register(r"address",AddressViewSet)