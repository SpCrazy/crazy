from rest_framework import serializers

from goods.models import *


class WheelSerializer(serializers.ModelSerializer):
    class Meta:
        model = Wheel
        fields = "__all__"


class AdvertisementSerializer(serializers.ModelSerializer):
    class Meta:
        model = Advertisement
        fields = "__all__"


class RecommendSerializer(serializers.ModelSerializer):
    class Meta:
        model = Recommend
        fields = "__all__"


class PhoneSerializer(serializers.ModelSerializer):
    class Meta:
        model = Phone
        fields = "__all__"


class NotebookComputerSerializer(serializers.ModelSerializer):
    class Meta:
        model = NotebookComputer
        fields = "__all__"


class TablePCSerializer(serializers.ModelSerializer):
    class Meta:
        model = TablePC
        fields = "__all__"


class WearSerializer(serializers.ModelSerializer):
    class Meta:
        model = Wear
        fields = "__all__"


class HomeFurnishingSerializer(serializers.ModelSerializer):
    class Meta:
        model = HomeFurnishing
        fields = "__all__"


class SellWellSerializer(serializers.ModelSerializer):
    class Meta:
        model = SellWell
        fields = "__all__"


class ProductTypeSerializer(serializers.ModelSerializer):
    class Meta:
        model = ProductType
        fields = "__all__"


class ShowSerializer(serializers.ModelSerializer):
    class Meta:
        model = Show
        fields = "__all__"


class GoodsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Goods
        fields = "__all__"


class ShowDownSerializer(serializers.ModelSerializer):
    class Meta:
        model = ShowDown
        fields = "__all__"


class ShowLeftSerializer(serializers.ModelSerializer):
    class Meta:
        model = ShowLeft
        fields = "__all__"