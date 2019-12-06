from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework import viewsets,mixins

from goods.filter import GoodsFilter, ShowFilter
from goods.serializers import *


@api_view(["GET"])
def home_view(request):
    wheels = Wheel.objects.all()
    advertisements = Advertisement.objects.all()
    phones = Phone.objects.all()
    whatchTv = WatchTV.objects.all()
    notebookcomputers = NotebookComputer.objects.all()
    homefurnishing = HomeFurnishing.objects.all()

    result = {
        'main_wheels': WheelSerializer(instance=wheels, many=True).data,
        'main_advertisements': AdvertisementSerializer(instance=advertisements, many=True).data,
        'main_whatchTv': WatchTVSerializer(instance=whatchTv, many=True).data,
        'main_phones': PhoneSerializer(instance=phones, many=True).data,
        'main_notebookcomputers': NotebookComputerSerializer(instance=notebookcomputers, many=True).data,
        'main_homefurnishing': HomeFurnishingSerializer(instance=homefurnishing, many=True).data,
    }
    return Response(result)


class ProductTypeViewSet(viewsets.GenericViewSet,mixins.ListModelMixin):
    queryset = ShowDown.objects.all()
    serializer_class = ShowDownSerializer
    filter_class = ShowFilter

    def list(self,request,*args,**kwargs):
        queryset = self.filter_queryset(self.get_queryset())
        ser = self.get_serializer(queryset,many=True)

        typeid = request.query_params.get("typeid")   # 接收商品的标识
        goods_type = ProductType.objects.get(typeid=typeid)

        goods_type_list = [{"recommedId":int(good.split(":")[1]),"recommedTitle":good.split(":")[0]} for good in goods_type.childtypenames.split("#")]


        for good_type in goods_type_list:
            good_lists = []
            for data in ser.data:
                good_dict = {}
                if good_type["recommedId"] == data["child_id"]:
                    good_dict["goods_id"] = data["goods_id"]
                    good_dict["goods_name"] = data["goods_name"]
                    good_dict["goods_src"] = data["goods_src"]
                    good_lists.append(good_dict)
            good_type["goods_list"] = good_lists

        result = {
            "categoryList":goods_type_list,
        }
        return Response(result)


class MarketViewSet(viewsets.GenericViewSet,mixins.ListModelMixin):
    queryset = Goods.objects.all()
    serializer_class = GoodsSerializer
    filter_class = GoodsFilter

    def list(self, request, *args, **kwargs):
        queryset = self.filter_queryset(self.get_queryset())
        ser = self.get_serializer(queryset, many=True)

        # result = {
        #     "goods": ser.data,
        # }
        return Response(ser.data)

class ShowLeftViewSet(viewsets.GenericViewSet,mixins.ListModelMixin):
    queryset = ShowLeft.objects.all()
    serializer_class = ShowLeftSerializer

    def list(self, request, *args, **kwargs):
        queryset = self.get_queryset()
        ser = self.get_serializer(queryset, many=True)


        result = {
            "goods": ser.data,
        }
        return Response(result)


class NewViewSet(viewsets.GenericViewSet,mixins.ListModelMixin):
    queryset = NewModel.objects.all()
    serializer_class = NewModelSerializer

    def list(self, request, *args, **kwargs):
        queryset = self.get_queryset()
        ser = self.get_serializer(queryset, many=True)

        result = {
            "goods": ser.data,
        }
        return Response(result)