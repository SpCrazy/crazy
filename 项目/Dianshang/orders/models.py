from django.db import models

from goods.models import Goods
from user.models import HuaweiUser


ORDER_STATE_NO_PAY = 1    # 待付款
ORDER_STATE_NO_GET = 2    # 待收货
ORDER_STATE_NO_EVA = 3    # 待评价


class Order(models.Model):   # 订单模型
    o_no = models.CharField(max_length=20,null=True)   # 订单号
    o_user = models.ForeignKey(HuaweiUser,on_delete=models.CASCADE)
    o_price = models.FloatField()  # 订单总价
    o_state = models.IntegerField(default=ORDER_STATE_NO_PAY)
    o_qita = models.CharField(max_length=50)  # 其他
    o_qita2 = models.CharField(max_length=50)  #其他2

    class Meta:
        db_table = "Huawei_order"

class OrderDetail(models.Model):    # 订单详情模型
    o_order = models.ForeignKey(Order,on_delete=models.CASCADE)  # 关联订单模型
    o_goods = models.ForeignKey(Goods,on_delete=models.CASCADE)  # 关联商品模型
    o_goods_num = models.IntegerField()  # 订单中商品的数量

    class Meta:
        db_table = "Huawei_orderdetail"