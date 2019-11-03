from django.db import models

class School(models.Model):
    name = models.CharField(max_length=20)
    address = models.CharField(max_length=30)

    class Meta:
        db_table = "schools"

class Student(models.Model):
    name = models.CharField(max_length=20)
    sex = models.CharField(max_length=10)
    score = models.FloatField()
    school = models.ForeignKey(School,on_delete=models.CASCADE,related_name="stu")

    class Meta:
        db_table = "students"
