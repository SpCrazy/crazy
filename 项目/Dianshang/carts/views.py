from rest_framework import viewsets,mixins
from rest_framework.decorators import list_route
from rest_framework.response import Response

from carts.models import Cart
from carts.serializers import CartSerializer
from goods.models import Goods
from user.user_authentication import UserTokenAuthentication
from util.error import HuaweiException


class CartViewSet(viewsets.GenericViewSet,mixins.ListModelMixin,
                  mixins.UpdateModelMixin,mixins.DestroyModelMixin):
    queryset = Cart.objects.all()
    serializer_class = CartSerializer
    authentication_classes = (UserTokenAuthentication,)

    #计算总价
    def total_price(self,user):
        carts = Cart.objects.filter(c_user=user,c_is_selected=True)  #获取用户购物车中已选中的信息
        total = 0
        for c in carts:
            total += c.c_goods_num * c.c_goods.goods_price  #计算总价
        return "{:.2f}".format(total)

    #展示购物车
    def list(self, request, *args, **kwargs):
        carts = Cart.objects.filter(c_user=request.user)  #获取用户购物车所有信息
        ser = self.get_serializer(carts,many=True)
        result = {
            "carts":ser.data,
            "total_price":self.total_price(request.user),
        }
        return Response(result)

    #更改购物车单个记录选中状态
    @list_route(methods=["PUT","PATCH"])
    def change(self, request, *args, **kwargs):
        goods_id = request.data.get("goodsid")
        goods = Goods.objects.filter(goods_id=goods_id).first()
        cart = Cart.objects.filter(c_goods_id=goods.id,c_user=request.user).first()  #获取需要修改状态的购物车信息
        cart.c_is_selected = not cart.c_is_selected   #反选状态
        cart.save()
        result = {
            "update":"选中状态已更改",
            "total_price": self.total_price(request.user),
        }
        return Response(result)

    #更改购物车全部记录选中状态  api接口为 api/cart/cart/updateall/
    @list_route(methods=["PUT","PATCH"])
    def updateall(self,request):
        carts = Cart.objects.filter(c_user=request.user)   #获取用户购物车所有信息
        select_list = []
        for c in carts:
            select_list.append(c.c_is_selected)   #将所有商品选定状态加入列表中
        if False in select_list:   #如果有未选定状态存在
            for c in carts:
                c.c_is_selected = True   #将所有商品变更为选定状态
                c.save()
            result = {
                "updateall_msg":"已经全选",
                "total_price": self.total_price(request.user),
            }
            return Response(result)
        else:   #如果没有未选定状态存在
            for c in carts:
                c.c_is_selected = False   #将所有商品变更为未选定状态
                c.save()
            result = {
                "updateall_msg": "已经全部不选",
                "total_price": self.total_price(request.user),
            }
            return Response(result)

    # 删除购物车记录  api接口为 api/cart/cart/del_cart/
    @list_route(methods=["POST"])
    def delcart(self,request):
        carts = Cart.objects.filter(c_user=request.user,c_is_selected=True)   #获取用户购物车所有选中的信息
        if  carts:
            for c in carts:
                c.delete()
            result = {
                "del_msg":"已删除选中商品",
                "total_price": self.total_price(request.user),
            }
            return Response(result)
        else:
            raise HuaweiException({"code":"6002","msg":"没有选中商品无法删除！"})

    # 添加购物车  api接口为 api/cart/cart/add_cart/
    @list_route(methods=["POST"])
    def addcart(self,request):
        goods_id = request.data.get("goodsid")  #加入的商品id
        goods_num = request.data.get("goodsnum") #加入的商品数量
        goods = Goods.objects.filter(goods_id=goods_id).first()
        cart = Cart.objects.filter(c_goods_id=goods.id,c_user=request.user).first()  #购物车对象
        current_goods_num = 0  #当前商品数量
        if cart:   #如果有该商品
            cart.c_goods_num += int(goods_num)   #商品数量为原数量 ＋ 添加数量
            cart.save()
            current_goods_num = cart.c_goods_num
            result = {
                "add_cart_msg":"添加成功",
                "current_goods_num": current_goods_num,
                "total_price": self.total_price(request.user),
            }
            return Response(result)
        else:   #如果没有该商品
            try:
                Cart.objects.create(c_user=request.user,c_goods_id=goods.id,c_goods_num=goods_num)  #添加商品到购物车
            except:
                raise HuaweiException({"code":"6000","msg":"添加购物车失败！"})
            current_goods_num = goods_num
            result = {
                "add_cart_msg": "添加成功",
                "current_goods_num": current_goods_num,
                "total_price": self.total_price(request.user),
            }
            return Response(result)


    # 减少购物车商品  api接口为 api/cart/cart/sub_cart/
    @list_route(methods=["POST"])
    def subcart(self,request):
        goods_id = request.data.get("goodsid")  #获取商品id
        goods = Goods.objects.filter(goods_id=goods_id).first()
        cart = Cart.objects.filter(c_goods_id=goods.id,c_user=request.user).first()#购物车对象
        current_goods_num = 0   #当前商品数量
        if cart:   #如果有该商品
            if cart.c_goods_num > 1:
                cart.c_goods_num -= 1
                cart.save()
                current_goods_num = cart.c_goods_num
            else:   #如果商品只剩下一个
                cart.delete()   #删除商品对象
            result = {
                "sub_cart_msg":"减少成功",
                "current_goods_num":current_goods_num,
                "total_price": self.total_price(request.user),
            }
            return Response(result)
        else:   #如果没有该商品
            raise HuaweiException({"code":"6001","msg":"购物车中无该商品，无法减少"})