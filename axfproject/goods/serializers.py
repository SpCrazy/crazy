from rest_framework import serializers

from goods.models import *


class WheelSerializer(serializers.ModelSerializer):
    class Meta:
        model = Wheel
        fields = "__all__"

class NavSerializer(serializers.ModelSerializer):
    class Meta:
        model = Nav
        fields = "__all__"

class MustbuySerializer(serializers.ModelSerializer):
    class Meta:
        model = Mustbuy
        fields = "__all__"

class ShopSerializer(serializers.ModelSerializer):
    class Meta:
        model = Shop
        fields = "__all__"

class MainshowSerializer(serializers.ModelSerializer):
    class Meta:
        model = Mainshow
        fields = "__all__"