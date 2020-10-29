from django.db import models


class User(models.Model):
    # unique=True 用户名不能重复
    class Meta:
        db_table='users'
        
    username = models.CharField(max_length=32,unique=True)
    password = models.CharField(max_length=256)
    salt = models.CharField(max_length=256)
    is_super = models.BooleanField(default=False)