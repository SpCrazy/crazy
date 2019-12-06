import uuid

from django.contrib.auth.hashers import make_password
from django.core.cache import cache
from django.shortcuts import render
from rest_framework import viewsets,mixins
from rest_framework.decorators import list_route
from rest_framework.response import Response

from user.models import AXFUser
from user.serializers import *


class UserViewSet(viewsets.GenericViewSet,
                  mixins.ListModelMixin):

    queryset = AXFUser.objects.all()
    serializer_class = UserSerializer

    def list(self, request, *args, **kwargs):
        token = request.query_params.get("token")
        user_id = cache.get(token)
        if user_id:
            user = AXFUser.objects.get(pk=user_id)
            ser = self.get_serializer(instance=user)

            result = {
                "user_info":ser.data
            }
            return Response(result)
        else:
            raise AXFException({"code":3000,"msg":"用户登录已过期。请重新登录"})


    @list_route(methods=["POST"],serializer_class=UserRegisterSerializer)
    def register(self,request):
        ser = self.get_serializer(data=request.data)
        is_valid = ser.is_valid(raise_exception=False)

        if not is_valid:
            raise AXFException({"code":1003,"msg":"格式错误，注册失败！！！"})

        u_username = ser.data["u_username"]
        u_password = make_password(ser.data["u_password"])
        u_email = ser.data["u_email"]

        user = AXFUser.objects.create(u_username=u_username,u_password=u_password,u_email=u_email)
        result = {
            "user_id":user.id
        }
        return Response(result)

    @list_route(methods=["POST"],serializer_class=UserLoginSerializer)
    def login(self,request):
        ser = self.get_serializer(data=request.data)
        is_valid = ser.is_valid(raise_exception=False)
        if not is_valid:
            raise AXFException({"code":2002,"msg":"登录格式错误，登录失败！！！"})

        #查询用户
        user = AXFUser.objects.filter(u_username=ser.data["u_username"]).first()
        token = uuid.uuid4().hex
        cache.set(token,user.id,timeout=60*60*24)
        result = {
            "token":token
        }
        return  Response(result)