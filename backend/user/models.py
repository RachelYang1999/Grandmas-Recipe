from django.db import models

class User(models.Model):
    class Meta:
        db_table = 'users'

    username = models.CharField(max_length=32, unique=True)
    password = models.CharField(max_length=100)
    salt = models.CharField(max_length=30)
    # is_super = models.BooleanField(default=False)
    email = models.EmailField(max_length=254, unique=True)
    introduction = models.CharField(max_length=1024,blank=True)
    gender = models.CharField(max_length=30)
    date_of_birth = models.CharField(max_length=30)
    register_date = models.DateTimeField(auto_now_add=True)
    total_follower = models.IntegerField(default=0)
    total_following = models.IntegerField(default=0)
    avatar = models.FileField(
        max_length=300, upload_to="avatar/", default="default.png")
