from django.db import models

class Student(models.Model):
    #模型类属性对应与表中的字段
    name = models.CharField(max_length=20)
    age = models.IntegerField()
    sex = models.CharField(max_length=20)
    score = models.FloatField()

    class Meta:
        db_table = "students"
