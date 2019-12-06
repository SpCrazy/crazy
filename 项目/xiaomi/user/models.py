from django.db import models


class XiaomiUser(models.Model):
    u_phone = models.CharField(max_length=20,unique=True,verbose_name="用户账号")    # 用户账号
    u_name = models.CharField(max_length=20,default=u_phone,verbose_name="用户昵称")
    u_password = models.CharField(max_length=256)
    u_email = models.EmailField(max_length=50,null=True)
    u_pic = models.CharField(max_length=256,null=True)


    class Meta:
        db_table = "xiaomi_user"
        verbose_name = "用户模型"
        verbose_name_plural = verbose_name


class Address(models.Model):   # 地址模型
    uname = models.CharField(max_length=20,null=True)    # 用户姓名
    uphone = models.CharField(max_length=20)    #用户手机号
    uotherphone = models.CharField(max_length=20,null=True)  # 备用手机号
    uaddress = models.CharField(max_length=50)   # 收货地址
    uotheraddress = models.CharField(max_length=50)    # 详细地址
    xiaomiuser = models.ManyToManyField(XiaomiUser,related_name="youraddress")
    isdefault = models.BooleanField(default=False)   # 是否为默认值


    class Meta:
        db_table = "xiaomi_address"