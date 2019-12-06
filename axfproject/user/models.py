from django.db import models

class AXFUser(models.Model):
    u_username = models.CharField(max_length=20,unique=True)
    u_password = models.CharField(max_length=256)
    u_email = models.CharField(max_length=50)
    is_active = models.BooleanField(default=False)  #是否激活
    is_delete = models.BooleanField(default=False)  #是否删除

    class Meta:
        db_table = "axf_user"
