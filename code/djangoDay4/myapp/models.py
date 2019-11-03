from django.db import models
from django.db.models import Manager


class CakeManager(Manager): #自定义对象管理器类
    def create_beauty_cake(self,name="水果蛋糕",price=205):
        #创建当前对象管理器所在的模型对象
        cake = self.model()
        cake.name = name
        cake.price = price
        cake.save()
        return cake




class Emp(models.Model):
    name = models.CharField(max_length=20)
    sex = models.CharField(max_length=10)
    salary = models.FloatField()
    is_married = models.BooleanField()

    class Meta:
        db_table = 'emps'


class Cake(models.Model):
    name = models.CharField(max_length=20)
    price = models.FloatField()
    #自定义的对象管理器
    cmanager = CakeManager()

    class Meta:
        db_table = "cakes"