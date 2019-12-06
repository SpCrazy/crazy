from django.db import models

from goods.models import Goods
from user.models import HuaweiUser


class Cart(models.Model):
    c_user = models.ForeignKey(HuaweiUser,on_delete=models.CASCADE)
    c_goods = models.ForeignKey(Goods,on_delete=models.CASCADE)
    c_goods_num = models.IntegerField(default=1)
    c_is_selected = models.BooleanField(default=True)   # 购物车种商品选中状态

    class Meta:
        db_table = "huawei_cart"