from django.db import models

from user.models import XiaomiUser


class Goods(models.Model):   # 商品详情模型

    img_src = models.TextField(null=True)   # 轮播图链接   字典套列表
    goods_id = models.BigIntegerField(verbose_name="商品id")  # 商品id
    goods_name = models.CharField(max_length=50,verbose_name="商品名字")  # 商品名称
    goods_price = models.IntegerField(verbose_name="商品价格")  # 商品价格
    goods_del_price = models.IntegerField(null=True)   # 注销价格
    goods_img_info = models.TextField(null=True)   # 性能
    goods_yellow_discount = models.CharField(max_length=100,null=True)   # 红色优惠
    goods_black_discount = models.CharField(max_length=100, null=True)  # 黑色优惠
    goods_info_img_src = models.TextField(null=True)    # 详情图片

    class Meta:
        db_table = "xiaomi_goods"
        verbose_name = "商品模型"
        verbose_name_plural = verbose_name
        # permissions = ("visit_product","Can Visit Product")



###################################首页########################################


class Main(models.Model):   #全为图片模块
    img_src = models.CharField(max_length=256,null=True)   # 图片链接

    class Meta:
        abstract = True  # 变为抽象模型


class Wheel(Main):  # 轮播模型

    class Meta:
        db_table = "xiaomi_wheel"


class Advertisement(Main):    # 广告

    class Meta:
        db_table = "xiaomi_advertisement"


class GoodsMain(models.Model):
    goods_id = models.BigIntegerField()  # 商品id
    goods_name = models.CharField(max_length=50)  # 商品名称
    img_src_info = models.CharField(max_length=256, null=True)  # 展示图片的链接
    goods_price = models.IntegerField()  # 商品价格
    goods_del_price = models.IntegerField(null=True)  # 注销价格
    goods_free = models.CharField(max_length=20, null=True)  # 商品优惠

    class Meta:
        abstract = True  # 变为抽象模型


class Phone(GoodsMain):   # 手机模型

    class Meta:
        db_table = "xiaomi_phone"


class WatchTV(GoodsMain):   # 电视机模型

    class Meta:
        db_table = "xiaomi_watchTV"


class NotebookComputer(GoodsMain):  # 笔记本电脑模型

    class Meta:
        db_table = "xiaomi_notebookcomputer"


class HomeFurnishing(GoodsMain):   # 家电模型

    class Meta:
        db_table = "xiaomi_home"


###################################商品分类页面#########################################



class ProductType(models.Model):   # 商品分类模型
    typeid = models.IntegerField()
    typename = models.CharField(max_length=50)
    childtypenames = models.CharField(max_length=200)
    typesort = models.IntegerField()

    class Meta:
        db_table = "xiaomi_producttype"


class Show(models.Model):   # 新品等上面图片
    img_src_info = models.CharField(max_length=256, null=True)  # 展示图片的链接

    class Meta:
        db_table = "xiaomi_show"


class ShowDown(models.Model):    #分类页小模块内容
    parent_id = models.IntegerField()  # 父类id
    child_id = models.IntegerField()   # 父类下子类id
    goods_id = models.BigIntegerField()    # 商品ID
    goods_name = models.CharField(max_length=20)   # 商品名称
    goods_src = models.CharField(max_length=256)    # 商品图片

    class Meta:
        db_table = "show_down"


class ShowLeft(models.Model):     # 分类页左侧模块
    type_id = models.IntegerField()    # 大类id
    type_name = models.CharField(max_length=10)  # 大类名字

    class Meta:
        db_table = "show_left"


class UserEvaluate(models.Model):    # 用户评价模型
    goods_id = models.BigIntegerField()  # 商品id
    user_name = models.ForeignKey(XiaomiUser,on_delete=True)   #用户id   # 用户名称
    user_star = models.IntegerField()   # 评论星级
    user_time = models.DateTimeField()   # 评价时间
    user_text = models.TextField()    # 评价内容
    user_pic = models.TextField()    # 评价图片    字典套列表
    user_good = models.IntegerField()    # 点赞数量
    user_official = models.TextField()   # 官方评价
    user_official_good = models.IntegerField()   #官方点赞数量

    class Meta:
        db_table = "xiaomi_userevaluate"


class NewGoods(models.Model):   # 新品发布上面
    img_src = models.CharField(max_length=256,null=True)   # 展示图片
    goods_name = models.CharField(max_length=50,null=True)   # 商品名称
    goods_info = models.CharField(max_length=50,null=True)    # 商品简介
    goods_price = models.IntegerField(null=True)   # 商品价格
    goods_del_price = models.IntegerField(null=True)    # 注销价格

    class Meta:
        db_table = "xiaomi_newgoods"


class NewModel(models.Model):   # 新品发布
    img_src = models.CharField(max_length=256,null=True)   # 展示图片
    goods_name = models.CharField(max_length=50,null=True)   # 商品名称
    goods_info = models.CharField(max_length=50,null=True)    # 商品简介
    goods_price = models.IntegerField(null=True)   # 商品价格
    goods_del_price = models.IntegerField(null=True)   # 注销价格

    class Meta:
        db_table = "xiaomi_newmodel"