import time

from alipay import AliPay
from django.core.cache import cache
from django.http import JsonResponse
from django.views.generic import View
from rest_framework import viewsets,mixins
from rest_framework.decorators import list_route
from rest_framework.response import Response

from Dianshang.settings import app_private_key_string, alipay_public_key_string
from carts.models import Cart
from orders.filters import OrdersFilter
from orders.models import Order, OrderDetail
from orders.serializers import OrderSerializer
from user.models import Address, HuaweiUser
from user.serializers import AddressSerializer
from user.user_authentication import UserTokenAuthentication
from util.error import HuaweiException


class OrderViewSet(viewsets.GenericViewSet,mixins.ListModelMixin,mixins.CreateModelMixin):
    queryset = Order.objects.all()
    serializer_class = OrderSerializer
    authentication_classes = (UserTokenAuthentication,)
    filter_class = OrdersFilter

    # 分类展示全部订单
    def get_queryset(self):
        return self.queryset.filter(o_user=self.request.user)   #获取当前用户所有订单

    #展示订单支付页
    @list_route(methods=["GET"])
    def listorder(self, request, *args, **kwargs):
        o_no = request.query_params.get("ono")   #获取订单号
        new_order = Order.objects.filter(o_user=request.user,o_no=o_no)  #通过订单号查找订单
        ser = self.get_serializer(new_order,many=True)
        result = {
            "order":ser.data
        }
        return Response(result)

    #添加订单
    @list_route(methods=["POST"])
    def addorder(self, request):
        carts = Cart.objects.filter(c_user=request.user,c_is_selected=True)  #获取购物车详情
        o_no = int(str(self.request.user.id) + str(round(time.time()*100000)))
        if carts:  #购物车中有选定的商品
            total = 0
            for c in carts:
                total += c.c_goods_num * c.c_goods.goods_price
            total = '{:.2f}'.format(total)   #计算总价
            new_order = Order.objects.create(o_user=request.user,o_price=float(total),o_no=o_no)   #创建新的订单
            for c in carts:
                OrderDetail.objects.create(o_order=new_order,o_goods=c.c_goods,o_goods_num=c.c_goods_num) #生成订单详情
                c.delete()  #下单成功删除该购物车信息
            result = {
                "add_msg": "添加成功",
                "o_no":new_order.o_no,
            }
            return Response(result)
        else:   #购物车中没有选中的商品
            raise HuaweiException({"code": "7000", "msg": "没有选中商品，无法下单"})

    # 取消订单
    @list_route(methods=["POST"])
    def delorder(self,request):
        o_no = request.data.get("ono")   #获取需要取消的订单号
        order = Order.objects.filter(o_user=request.user,o_no=o_no)   #获取需要取消的订单
        if order:   #存在该订单
            for o in order:
                OrderDetail.objects.filter(o_order=o).delete()  # 删除订单详情
            order.delete()   #取消订单
            result = {
                "del_msg":"取消订单成功"
            }
            return Response(result)
        else:   #不存在该订单
            raise HuaweiException({"code": "7001", "msg": "没有该订单，无法取消"})


#支付
class OrderPayView(View):

    def post(self, request):
        try:
            token = request.POST.get("token") if request.POST.get("token") else request.GET.get("token")
            user_id = cache.get(token)
            user = HuaweiUser.objects.get(pk=user_id)

        except:
            raise HuaweiException({"code": 5001, "msg": "未登录，请先登录！！！"})

        o_no = request.POST.get("ono")
        if not o_no:
            raise HuaweiException({"code": 8002, "msg": "无效的订单号！"})
        try:
            order = Order.objects.filter(o_no=o_no, o_user=user, o_state=1).first()
        except Order.DoesNotExist:
            raise HuaweiException({"code": 8003, "msg": "订单错误！"})



        if order.o_price == 0:
            order.o_state = 2
            order.save()
            result = {
                'data': '支付成功'
            }
            return Response(result)

        # 实例化支付应用
        alipay = AliPay(
            appid="2016100200646460",
            app_notify_url=None,
            app_private_key_string=app_private_key_string,
            alipay_public_key_string=alipay_public_key_string,
            sign_type="RSA2"
        )

        total_price = order.o_price
        # 发起支付请求
        order_string = alipay.api_alipay_trade_page_pay(
            out_trade_no=o_no,  # 订单号，多次请求不能一样
            total_amount=str(total_price),  # 支付金额
            subject="华为商城%s" % o_no,  # 交易主题
            return_url=None,
            notify_url=None
        )
        pay_url = "https://openapi.alipaydev.com/gateway.do?"+order_string

        result = {
            "pay_url": pay_url
        }

        return JsonResponse(result)



class CheckPayView(View):
    # 查看订单支付的结果
    def post(self, request):
        # 用户是否登录
        try:
            token = request.POST.get("token") if request.POST.get("token") else request.GET.get("token")
            user_id = cache.get(token)
            user = HuaweiUser.objects.get(pk=user_id)
        except:
            raise HuaweiException({"code": 5001, "msg": "未登录，请先登录！！！"})

        # 接收参数
        order_id = request.POST.get('ono')
        # 校验参数
        if not order_id:
            raise HuaweiException({"code": 8002, "msg": "无效的订单号！"})
        try:
            order = Order.objects.filter(o_no=order_id, o_user=user, o_state=1).first()
        except Order.DoesNotExist:
            raise HuaweiException({"code": 8003, "msg": "订单错误！"})

        if order.o_state == 2:
            result = {
                'data': '已经支付！'
            }
            return Response(result)

        # 业务处理:使用python sdk调用支付宝的支付接口
        # 初始化
        alipay = AliPay(
            appid="2016100200646460",  # 应用id
            app_notify_url=None,  # 默认回调url
            app_private_key_string=app_private_key_string,
            alipay_public_key_string=alipay_public_key_string,
            # 支付宝的公钥，验证支付宝回传消息使用，不是你自己的公钥,
            sign_type="RSA2",  # RSA 或者 RSA2
            debug=True  # 默认False
        )
        # 调用支付宝的交易查询接口
        print("yanzhengdaozhelile")
        while True:
            response = alipay.api_alipay_trade_query(order_id)
            code = response.get('code')
            print(response)
            if code == '10000' and response.get('trade_status') == 'TRADE_SUCCESS':
                # 支付成功
                # 更新订单状态
                order.o_state = 2
                order.save()
                # 返回结果
                result = {
                    "code": 200,
                    "msg": "ok",
                    'data': '支付成功'
                }
                return JsonResponse(result)
            elif code == '40004' or (code == '10000' and response.get('trade_status') == 'WAIT_BUYER_PAY'):
                # 等待买家付款
                # 业务处理失败，可能一会就会成功
                import time
                time.sleep(5)
                continue
            else:
                # 支付出错
                print(code)
                return JsonResponse({"code": 8003, "msg": "支付失败！"})