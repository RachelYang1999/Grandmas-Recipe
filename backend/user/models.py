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
    date_of_birth = models.DateField(auto_now_add=True)
    register_date = models.DateTimeField(auto_now_add=True)
    total_follower = models.IntegerField(default=0)
    total_following = models.IntegerField(default=0)
    profile_image = models.ImageField(upload_to='avatar', null=True, blank=True,default="avatar/default.png")


class User_follow(models.Model):
    class Meta:
        db_table = 'user_follow'

    from_user =  models.ForeignKey(User, related_name='from_user',on_delete=models.CASCADE)
    to_user =  models.ForeignKey(User, related_name='to_user',on_delete=models.CASCADE)
