from django.contrib.auth.models import User
from rest_framework import serializers

from goods.serializers import GoodsSerializer
from orders.models import *
from user.models import Address
from user.serializers import AddressSerializer


class OrderSerializer(serializers.ModelSerializer):
    # 给订单添加新属性
    def to_representation(self, instance):
        order_dict = super().to_representation(instance)   #调用父类的to_representation方法，将对象拆分为字典对象
        order_details = instance.orderdetail_set.all()   #获取当前订单关联的订单详情对象
        user = instance.o_user   #获取当前订单的用户
        order_address = Address.objects.filter(huaweiuser=user,isdefault=True)   #通过用户查找该默认地址
        address = AddressSerializer(order_address,many=True).data   #获取序列化厚的地址信息
        details = OrderDetailSerializer(order_details,many=True).data   #获取序列化后订单详情
        order_dict["order_goods_info"] = details   #给订单添加order_goods_info的新属性
        order_dict["address_info"] = address   #给订单添加address_info的新属性
        return order_dict

    class Meta:
        model = Order
        fields = "__all__"

class OrderDetailSerializer(serializers.ModelSerializer):
    o_goods = GoodsSerializer()
    class Meta:
        model = OrderDetail
        fields = "__all__"
