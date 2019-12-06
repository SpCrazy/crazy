from django.db import models

class Main(models.Model):
    img = models.CharField(max_length=256)
    name = models.CharField(max_length=50)
    trackid = models.IntegerField()

    class Meta:
        abstract = True  #变为抽象模型

class Wheel(Main):  #轮播模型
    class Meta:
        db_table = "axf_wheel"


class Nav(Main):   #导航模型
    class Meta:
        db_table = "axf_nav"


class Mustbuy(Main):    #必购模型
    class Meta:
        db_table = "axf_mustbuy"

class Shop(Main):   #商店模型
    class Meta:
        db_table = "axf_shop"

class Mainshow(Main):
    categoryid = models.IntegerField()
    brandname = models.CharField(max_length=50)
    img1 = models.CharField(max_length=256)
    childcid1 = models.IntegerField()
    productid1 = models.IntegerField()
    longname1 = models.CharField(max_length=50)
    price1 = models.FloatField()
    marketprice1 = models.FloatField()

    img2 = models.CharField(max_length=256)
    childcid2 = models.IntegerField()
    productid2 = models.IntegerField()
    longname2 = models.CharField(max_length=50)
    price2 = models.FloatField()
    marketprice2 = models.FloatField()

    img3 = models.CharField(max_length=256)
    childcid3 = models.IntegerField()
    productid3 = models.IntegerField()
    longname3 = models.CharField(max_length=50)
    price3 = models.FloatField()
    marketprice3 = models.FloatField()

    class Meta:
        db_table = "axf_mainshow"

class FoodType(models.Model):
    typeid = models.IntegerField()
    typename = models.CharField(max_length=50)
    childtypenames = models.CharField(max_length=200)
    typesort = models.IntegerField()

    class Meta:
        db_table = "axf_foodtypes"

class Goods(models.Model):
    productid = models.IntegerField()
    productimg = models.CharField(max_length=256)
    productname = models.CharField(max_length=100)
    productlongname = models.CharField(max_length=200)
    isxf = models.BooleanField()
    pmdesc = models.BooleanField()
    specifics = models.CharField(max_length=20)
    price = models.FloatField()
    marketprice = models.FloatField()
    categoryid = models.IntegerField()
    childcid = models.IntegerField()
    childcidname = models.CharField(max_length=50)
    dealerid = models.IntegerField()
    storenums = models.IntegerField()
    productnum = models.IntegerField()

    class Meta:
        db_table = "axf_goods"





