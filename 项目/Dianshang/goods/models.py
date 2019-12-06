from django.db import models

from user.models import HuaweiUser


class Goods(models.Model):   # 商品详情模型
    img_src = models.TextField(null=True)  # 轮播图链接   字典套列表
    goods_id = models.BigIntegerField(verbose_name="商品id")  # 商品id
    goods_name = models.CharField(max_length=50, verbose_name="商品名字")  # 商品名称
    goods_price = models.IntegerField(verbose_name="商品价格")  # 商品价格
    goods_black_discount = models.CharField(max_length=100, null=True)  # 黑色优惠
    goods_red_discount = models.CharField(max_length=100, null=True)  # 红色优惠
    goods_promotion = models.CharField(max_length=100, null=True)  # 商品促销
    goods_color = models.CharField(max_length=100, null=True)  # 商品颜色
    goods_edition = models.CharField(max_length=50, null=True)  # 商品版本
    goods_set_meal = models.CharField(max_length=50, null=True)  # 商品套餐
    goods_num = models.IntegerField(default=1)  # 商品数量
    goods_guarantee = models.CharField(max_length=100, null=True)  # 商品保障
    goods_service = models.CharField(max_length=100, null=True)  # 商品服务
    goods_info_img_src = models.TextField(null=True)  # 详情图片
    # detailid = models.IntegerField()   #分类页详情id（如分会场）
    g_evaluate = models.IntegerField()  # 评价人数
    g_good = models.IntegerField()  # 好评率
    g_img = models.CharField(max_length=256,null=True)   # 用户头像
    g_name = models.CharField(max_length=20,null=True)   # 用户名
    g_good_info = models.TextField(null=True)   # 评价内容
    main_param = models.TextField()  # 主要参数    字典套字典
    param_info = models.TextField(null=True)   # 详细参数
    param_baozhuang = models.TextField(null=True)   # 包装清单


    class Meta:
        db_table = "huawei_goods"
        verbose_name = "商品模型"
        verbose_name_plural = verbose_name
        # permissions = ("visit_product","Can Visit Product")



###################################首页########################################


class Main(models.Model):   #全为图片模块
    img_src = models.CharField(max_length=256,null=True)   # 图片链接
    name = models.CharField(max_length=50)

    class Meta:
        abstract = True  # 变为抽象模型


class Wheel(Main):  # 轮播模型

    class Meta:
        db_table = "huawei_wheel"


class Advertisement(Main):   # 广告

    class Meta:
        db_table = "huawei_advertisement"


class GoodsMain(models.Model):
    goods_id = models.BigIntegerField()  # 商品id
    goods_name = models.CharField(max_length=50)  # 商品名称
    img_src_info = models.CharField(max_length=256, null=True)  # 展示图片的链接
    goods_price = models.IntegerField()  # 商品价格
    goods_del_price = models.IntegerField(null=True)  # 注销价格
    goods_free = models.CharField(max_length=20, null=True)  # 商品优惠
    good_other_free = models.CharField(max_length=20,null=True)  # 图片上面标签  如新品

    class Meta:
        abstract = True  # 变为抽象模型


class Recommend(GoodsMain):  # 精品推荐模型

    class Meta:
        db_table = "huawei_recommend"


class Phone(GoodsMain):   # 手机模型

    class Meta:
        db_table = "huawei_phone"


class NotebookComputer(GoodsMain):  # 笔记本电脑模型

    class Meta:
        db_table = "huawei_notebookcomputer"


class TablePC(GoodsMain):  # 平板电脑模型

    class Meta:
        db_table = "huawei_tablePC"


class Wear(GoodsMain):  # 智能穿戴模型

    class Meta:
        db_table = "huawei_wear"


class HomeFurnishing(GoodsMain):   # 智能家居模型

    class Meta:
        db_table = "huawei_homefurnishing"


class SellWell(GoodsMain):   # 热销推荐模型

    class Meta:
        db_table = "huawei_sellwell"

###################################商品分类页面#########################################



class ProductType(models.Model):        # 商品分类模型
    typeid = models.IntegerField()
    typename = models.CharField(max_length=50)
    childtypenames = models.CharField(max_length=200)
    # typesort = models.IntegerField()

    class Meta:
        db_table = "huawei_producttype"


class Show(models.Model):   # 新品等上面图片
    goods_id = models.BigIntegerField()  # 商品id
    goods_name = models.CharField(max_length=50)  # 商品名称
    img_src_info = models.CharField(max_length=256, null=True)  # 展示图片的链接


    class Meta:
        db_table = "show"


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
    user_img = models.CharField(max_length=256)  # 用户头像
    user_name = models.CharField(max_length=20)   # 用户昵称
    user_text = models.TextField()    # 评价内容
    user_pic = models.TextField()    # 评价图片    字典套列表

    class Meta:
        db_table = "huawei_userevaluate"