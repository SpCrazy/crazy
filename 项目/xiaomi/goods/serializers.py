from rest_framework import serializers

from goods.models import *


class GoodsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Goods
        fields = "__all__"


class WheelSerializer(serializers.ModelSerializer):
    class Meta:
        model = Wheel
        fields = "__all__"


class AdvertisementSerializer(serializers.ModelSerializer):
    class Meta:
        model = Advertisement
        fields = "__all__"


class PhoneSerializer(serializers.ModelSerializer):
    class Meta:
        model = Phone
        fields = "__all__"


class NotebookComputerSerializer(serializers.ModelSerializer):
    class Meta:
        model = NotebookComputer
        fields = "__all__"


class WatchTVSerializer(serializers.ModelSerializer):
    class Meta:
        model = WatchTV
        fields = "__all__"


class HomeFurnishingSerializer(serializers.ModelSerializer):
    class Meta:
        model = HomeFurnishing
        fields = "__all__"



class ShowDownSerializer(serializers.ModelSerializer):
    class Meta:
        model = ShowDown
        fields = "__all__"


class ProductTypeSerializer(serializers.ModelSerializer):
    class Meta:
        model = ProductType
        fields = "__all__"


class ShowSerializer(serializers.ModelSerializer):
    class Meta:
        model = Show
        fields = "__all__"

class UserEvaluateSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserEvaluate
        fields = "__all__"


class ShowLeftSerializer(serializers.ModelSerializer):
    class Meta:
        model = ShowLeft
        fields = "__all__"


class NewModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = NewModel
        fields = "__all__"
