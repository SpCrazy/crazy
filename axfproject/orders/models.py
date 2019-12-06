from django.db import models

from goods.models import Goods
from user.models import AXFUser

ORDER_STATE_NO_PAY = 1  #已下单，未付款
ORDER_STATE_NO_SEND = 2 #已付款，为发货



class Orders(models.Model):
    o_user = models.ForeignKey(AXFUser,on_delete=models.CASCADE)
    o_price = models.FloatField()
    o_time = models.DateTimeField(auto_now=True)
    o_state = models.IntegerField(default=ORDER_STATE_NO_PAY)

    class Meta:
        db_table = "axf_orders"



class OrderDetail(models.Model):
    o_order = models.ForeignKey(Orders,on_delete=models.CASCADE)
    o_goods = models.ForeignKey(Goods,on_delete=models.CASCADE)
    o_goods_num = models.IntegerField()

    class Meta:
        db_table = "axf_orderdetail"