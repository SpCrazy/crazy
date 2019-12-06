from django.contrib.auth.hashers import check_password
from  rest_framework import serializers

from user.models import AXFUser
from util.error import AXFException


class UserSerializer(serializers.ModelSerializer):

    class Meta:
        model = AXFUser
        fields = "__all__"


class UserRegisterSerializer(serializers.Serializer):
    u_username = serializers.CharField(max_length=20,required=True)
    u_password = serializers.CharField(max_length=20,required=True)
    u_password2 = serializers.CharField(max_length=20,required=True)
    u_email = serializers.CharField(max_length=50,required=True)

    def validate(self, attrs):
        username = attrs.get("u_username")
        password = attrs.get("u_password")
        password2 = attrs.get("u_password2")
        email = attrs.get("u_email")

        if AXFUser.objects.filter(u_username=username).exists():
            raise AXFException({"code":1000,"msg":"用户名已存在，注册失败"})
        if password != password2:
            raise AXFException({"code":1001,"msg":"两次密码不一致，注册失败！！！"})
        if AXFUser.objects.filter(u_email=email).exists():
            raise AXFException({"code":1002,"msg":"邮箱已存在，注册失败！！！"})
        return attrs


class UserLoginSerializer(serializers.Serializer):
    u_username = serializers.CharField(max_length=20,required=True)
    u_password = serializers.CharField(max_length=20,required=True)

    def validate(self, attrs):
        username = attrs.get("u_username")
        pwd = attrs.get("u_password")
        if not AXFUser.objects.filter(u_username=username):
            raise AXFException({"code":2000,"msg":"用户不存在，登录失败！！"})
        user = AXFUser.objects.filter(u_username=username).first()
        if not check_password(pwd,user.u_password):
            raise AXFException({"code":2001,"msg":"密码错误，登录失败！！！"})
        return attrs