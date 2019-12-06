import uuid

from django.contrib.auth.hashers import make_password
from django.core.cache import cache
from rest_framework import viewsets,mixins
from rest_framework.decorators import list_route
from rest_framework.response import Response

from orders.models import Order, ORDER_STATE_NO_PAY,ORDER_STATE_NO_GET,ORDER_STATE_NO_EVA
from user.serializers import *
from user.user_authentication import UserTokenAuthentication
from util.send_email_captcha import  send_captcha_email
from util.error import HuaweiException
from util.send_msg_captcha import SendMsg


class UserViewSet(viewsets.GenericViewSet,mixins.ListModelMixin):
    queryset = HuaweiUser.objects.all()
    serializer_class = UserSerializer

    def list(self, request, *args, **kwargs):
        token = request.query_params.get("token")
        user_id = cache.get(token)
        if user_id:
            user = HuaweiUser.objects.filter(id=user_id).first()
            ser = self.get_serializer(instance=user)
            order = Order.objects.filter(o_user=user)
            order_not_pay_num = order.filter(o_state=ORDER_STATE_NO_PAY).count()  # 获取未付款订单数量
            order_not_get_num = order.filter(o_state=ORDER_STATE_NO_GET).count()  # 获取未收货订单数量
            order_not_eva_num = order.filter(o_state=ORDER_STATE_NO_EVA).count()  # 获取未评价订单数量
            result = {
                "user_info":ser.data,
                "order_not_pay_num":order_not_pay_num,
                "order_not_get_num":order_not_get_num,
                "order_not_eva_num":order_not_eva_num,
            }
            return Response(result)
        else:
            raise HuaweiException({"code":3001,"msg":"用户信息已过期，请重新登陆"})

    @list_route(methods=["POST"],serializer_class=UserRegisterSerializer)
    def register(self,request):
        serializer = self.get_serializer(data=request.data)
        is_valid = serializer.is_valid(raise_exception=False)

        if not is_valid:
            raise HuaweiException({"code":1003,"msg":"注册数据个数不正确"})
        u_phone = serializer.data["uphone"]
        u_password = serializer.data["upassword"]
        userpassword = make_password(u_password)
        new_user = HuaweiUser.objects.create(u_phone=u_phone,u_name=u_phone,u_password=userpassword)
        result = {
            "user_id":new_user.id
        }
        return Response(result)

    @list_route(methods=["POST"],serializer_class=UserLoginSerializer)
    def login(self,request):
        serializer = self.get_serializer(data=request.data)
        is_valid = serializer.is_valid(raise_exception=False)
        if not is_valid:
            raise HuaweiException({"code":2002,"msg":"登录数据有误"})
        user = HuaweiUser.objects.filter(u_phone=serializer.data["uphone"]).first()
        token = uuid.uuid4().hex
        cache.set(token,user.id,timeout=60*60*24)
        result = {
            "token":token
        }
        return Response(result)

    @list_route(methods=["POST"],serializer_class=UserCaptchaSerializer)
    def captcha(self,request):
        ser = self.get_serializer(data=request.data)
        is_valid = ser.is_valid(raise_exception=False)
        if not is_valid:
            raise HuaweiException({"code": 1, "msg": "手机号验证有误"})
        u_phone = ser.data["uphone"]
        print(u_phone)
        send_msg = SendMsg()
        captcha = send_msg.send_msg_mobile(u_phone)   #发送邮件，获取验证码
        print(captcha)
        if not captcha:
            raise HuaweiException({"code": 2, "msg": "验证码获取失败！"})
        cache.set(u_phone,captcha,timeout=60*5)
        result = {
            "code": 200,
            "msg": "验证码获取成功"
        }
        return Response(result)

    @list_route(methods=["POST"],serializer_class=UserFindPasswordSerializer)
    def findpassword(self,request):
        ser = self.get_serializer(data=request.data)
        is_valid = ser.is_valid(raise_exception=False)
        if not is_valid:
            raise HuaweiException({"code": 1, "msg": "邮箱验证有误"})
        u_phone = ser.data["uphone"]
        u_email = ser.data["uemail"]
        user = HuaweiUser.objects.filter(u_phone=u_phone,u_email=u_email).first()
        token = send_captcha_email(u_email)  # 发送邮件，获取验证码
        if not token:
            raise HuaweiException({"code": 2, "msg": "邮件发送失败！"})
        cache.set(token, user.id, timeout=60 * 60 * 48)
        result = {
            "token": token,
        }
        return Response(result)

    @list_route(methods=["POST","GET"],serializer_class=UserResetPasswordSerializer)
    def resetpassword(self,request):
        if request.method == "GET":
            token = request.query_params.get("token")
            # print("token===",token)
            user_id = cache.get(token)
            if user_id:
                user = HuaweiUser.objects.filter(id=user_id).first()
                # ser = self.get_serializer(instance=user)
                # print(ser.data)
                result = {
                    "user_name": user.u_phone
                }
            else:
                result = {
                    "code": "101",
                    "msg": "用户不存在！"
                }
            return Response(result)
        if request.method == "POST":
            token = request.data.get("token")
            user_id = cache.get(token)
            user = HuaweiUser.objects.filter(id=user_id).first()
            ser = self.get_serializer(data=request.data)
            is_valid = ser.is_valid(raise_exception=False)
            if not is_valid:
                raise HuaweiException({"code": 102 ,"msg": "密码重置失败"})
            u_password = ser.data["upassword"]
            userpassword = make_password(u_password)
            user.u_password = userpassword
            user.save()
            result = {
                "code": 200,
                "msg": "密码重置成功，请登录"
            }
            return Response(result)


class AddressViewSet(viewsets.GenericViewSet,mixins.ListModelMixin,mixins.UpdateModelMixin):
    queryset = Address.objects.all()
    serializer_class = AddressSerializer
    authentication_classes = (UserTokenAuthentication,)

    #展示地址详情
    def list(self, request, *args, **kwargs):
        address = Address.objects.filter(huaweiuser=request.user)   #获取当前用户所有地址对象
        ser = self.get_serializer(address,many=True)
        result = {
            "address":ser.data
        }
        return Response(result)

    #添加地址
    @list_route(methods=["POST"],serializer_class=AddAddressSerializer)
    def addaddress(self,request):
        user = request.user
        if user:
            ser = self.get_serializer(data=request.data)   #将要添加的所有信息序列化
            is_valid = ser.is_valid(raise_exception=False)  #进行格式和逻辑验证
            if not is_valid:   #格式验证不通过
                raise HuaweiException({"code": 4000, "msg": "数据格式有误"})
            u_name = ser.data["uname"]
            u_phone = ser.data["uphone"]
            u_other_phone = ser.data["uotherphone"]
            u_address = ser.data["uaddress"]
            u_other_address = ser.data["uotheraddress"]
            new_address = Address.objects.create(uname=u_name,uaddress=u_address,uphone=u_phone,uotheraddress=u_other_address,
                                                 uotherphone=u_other_phone)   #创建地址
            new_address.huaweiuser.add(request.user)   #将该地址和用户关联
            result = {
                "address_id": new_address.id
            }
            return Response(result)
        else:
            raise HuaweiException({"code": 5000, "msg": "请先登录"})

    # 设置为默认地址
    @list_route(methods=["PUT", "PANCH"])
    def updatedefault(self, request):
        address_id = request.data.get("addressid")  # 获取需要设置为默认的地址的id
        addresses = Address.objects.filter(huaweiuser=request.user)  # 获取该用户全部地址
        address = Address.objects.filter(huaweiuser=request.user, id=address_id).first()  # 获取需要修改的地址
        for a in addresses:
            a.isdefault = False
            a.save()
        address.isdefault = True  # 将当前地址设为默认
        address.save()
        result = {
            "default_msg:": "已经设置为默认地址"
        }
        return Response(result)

    #删除地址
    @list_route(methods=["POST"])
    def deladdress(self,request):
        address_id = request.data.get("addressid")   #通过address_id获取要删除的对象
        address = Address.objects.filter(id=address_id,huaweiuser=request.user)  #筛选出要删除的地址
        if address:
            address.delete()
            result = {
                "del_msg":"删除成功"
            }
            return Response(result)
        else:
            raise HuaweiException({"code": 4001, "msg": "没有该地址，无法删除"})

    #修改地址
    @list_route(methods=["PUT","PATCH"],serializer_class=UpdateAddressSerializer)
    def updateaddress(self, request):
        address_id = request.query_params.get("addressid")   #通过路由传参获取需要更改的地址
        address = Address.objects.filter(id=address_id,huaweiuser=request.user).first()   #获取原数据
        ser = self.get_serializer(address, data=request.data, partial=True)   #整合新数据和原数据
        is_valid = ser.is_valid(raise_exception=False)  # 进行格式和逻辑验证
        if not is_valid:  # 格式验证不通过
            raise HuaweiException({"code": 4000, "msg": "数据格式有误"})
        else:
            ser.save()
            result = {
                "update_msg":"修改成功",
                "address":ser.data
            }
            return Response(result)
