import re

from django.contrib.auth.hashers import check_password
from django.core.cache import cache
from rest_framework import serializers

from user.models import HuaweiUser, Address
from util.error import HuaweiException


class UserSerializer(serializers.ModelSerializer):

    class Meta:
        model = HuaweiUser
        fields = "__all__"

class UserRegisterSerializer(serializers.Serializer):
    # 前后端沟通好接受的参数名
    uphone = serializers.CharField(max_length=20,required=True)
    upassword = serializers.CharField(max_length=20,required=True)
    upassword2 = serializers.CharField(max_length=20,required=True)
    ucaptcha = serializers.CharField(max_length=10,required=True)

    def validate(self, attrs):
        phone = attrs.get("uphone")
        password = attrs.get("upassword")
        password2 = attrs.get("upassword2")
        u_captcha = attrs.get("ucaptcha")

        captcha = cache.get(phone)

        if HuaweiUser.objects.filter(u_phone=phone).exists():
            raise HuaweiException({"code":1000,"msg":"该用户名已存在!"})
        if not password == password2:
            raise HuaweiException({"code":1001,"msg":"两次密码不一致"})
        if not u_captcha == captcha:
            raise HuaweiException({"code": 1004, "msg": "验证码错误！"})
        return attrs

class UserLoginSerializer(serializers.Serializer):
    uphone = serializers.CharField(max_length=20,required=True)
    upassword = serializers.CharField(max_length=20,required=True)

    def validate(self,attrs):
        if not HuaweiUser.objects.filter(u_phone=attrs.get("uphone")).exists():
            raise HuaweiException({"code":2000,"msg":"手机号不正确"})

        user = HuaweiUser.objects.filter(u_phone=attrs.get("uphone")).first()
        if not check_password(attrs.get("upassword"),user.u_password):
            raise HuaweiException({"code":2001,"msg":"登陆密码不正确"})
        return attrs


class UserCaptchaSerializer(serializers.Serializer):
    uphone = serializers.CharField(max_length=50, required=True)

    def validate(self, attrs):
        phone = attrs.get("uphone")

        if not re.match(r"1[3-9]\d{9}$", phone):
            raise HuaweiException({"code": 3001, "msg": "手机号有误！"})
        return attrs


class UserFindPasswordSerializer(serializers.Serializer):
    uphone = serializers.CharField(max_length=20, required=True)
    uemail = serializers.CharField(max_length=50, required=True)


class UserResetPasswordSerializer(serializers.Serializer):
    upassword = serializers.CharField(max_length=20, required=True)
    upassword2 = serializers.CharField(max_length=20, required=True)

    def validate(self, attrs):
        password = attrs.get("upassword")
        password2 = attrs.get("upassword2")
        if not password == password2:
            raise HuaweiException({"code": 1001, "msg": "两次密码不一致"})
        return attrs


class AddressSerializer(serializers.ModelSerializer):

    class Meta:
        model = Address
        fields = "__all__"


class AddAddressSerializer(serializers.Serializer):
    uname = serializers.CharField(max_length=20)
    uphone = serializers.CharField(max_length=20)
    uotherphone = serializers.CharField(max_length=20,allow_blank=True)   #allow_blank可以为空
    uaddress = serializers.CharField(max_length=50)
    uotheraddress = serializers.CharField(max_length=50,allow_blank=True)
    isdefault = serializers.BooleanField()

    def validate(self, attrs):
        phone = attrs.get("uphone")
        if not re.match(r"1[3-9]\d{9}$", phone):
            raise HuaweiException({"code": 3001, "msg": "手机号有误！"})

        return attrs


class UpdateAddressSerializer(serializers.ModelSerializer):
    uname = serializers.CharField(max_length=20)
    uphone = serializers.CharField(max_length=20)
    uotherphone = serializers.CharField(max_length=20)
    uaddress = serializers.CharField(max_length=50)
    uotheraddress = serializers.CharField(max_length=50)
    isdefault = serializers.BooleanField()

    def validate(self, attrs):
        phone = attrs.get("uphone")
        u_other_phone = attrs.get("uotherphone")
        if phone:
            if not re.match(r"1[3-9]\d{9}$", phone):
                raise HuaweiException({"code": 3001, "msg": "手机号有误！"})
        return attrs

    class Meta:
        model = Address
        fields = "__all__"