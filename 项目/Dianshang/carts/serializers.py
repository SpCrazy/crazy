from rest_framework import serializers

from carts.models import Cart
from goods.serializers import GoodsSerializer


class CartSerializer(serializers.ModelSerializer):  #购物车序列化模型

    c_goods = GoodsSerializer()

    class Meta:
        model = Cart
        fields = "__all__"