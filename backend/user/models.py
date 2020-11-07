from django.db import models
from calendars.models import Calendar

class User(models.Model):
    class Meta:
        db_table = 'users'

    username = models.CharField(max_length=32, unique=True)
    password = models.CharField(max_length=100)
    salt = models.CharField(max_length=30)
    # is_super = models.BooleanField(default=False)
    email = models.EmailField(max_length=254, unique=True)
    introduction = models.CharField(max_length=1024)
    gender = models.CharField(max_length=30)
    register_date = models.DateTimeField(auto_now_add=True)
    total_follower = models.IntegerField(default=0)
    total_followering = models.IntegerField(default=0)
    avatar = models.FileField(
        max_length=300, upload_to="avatar/", default="default.png")


class User_follow(models.Model):
    class Meta:
        db_table = 'user_follow'

    # from_user =  models.ForeignKey(User, related_name='from_user',on_delete=models.CASCADE)
    # to_user =  models.ForeignKey(User, related_name='to_user',on_delete=models.CASCADE)


class User_calender(models.Model):
    class Meta:
        db_table = 'user_calendar'

    # user =  models.ForeignKey(Calendar, related_name='calendar_user',on_delete=models.CASCADE)
    # calendar =  models.ForeignKey(Calendar, related_name='user_calender',on_delete=models.CASCADE)