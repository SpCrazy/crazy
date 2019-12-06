from rest_framework.decorators import api_view
from rest_framework.response import Response

from goods.serializers import *


@api_view(['GET'])
def home_view(request):
    wheels = Wheel.objects.all()
    navs = Nav.objects.all()
    mustbuys = Mustbuy.objects.all()
    shops = Shop.objects.all()
    shows = Mainshow.objects.all()
    result = {
        "main_wheels":WheelSerializer(instance=wheels,many=True).data,
        "main_navs": NavSerializer(instance=navs, many=True).data,
        "main_mustbuys": MustbuySerializer(instance=mustbuys, many=True).data,
        "main_shops": ShopSerializer(instance=shops, many=True).data,
        "main_shows": MainshowSerializer(instance=shows, many=True).data,
    }
    return Response(result)