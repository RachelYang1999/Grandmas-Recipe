from django.db import models
from user.models import User

# Create your models here.
class Upload_profile(models.Model):
    class Meta:
        db_table = 'user_profile_metadata'
    user = models.ForeignKey(User, related_name='userprofileimage',on_delete=models.CASCADE,default=1)
    profile_image = models.ImageField(upload_to='avatar', null=True, blank=True,default="default.png")

class Upload_recipe(models.Model):
    class Meta:
        db_table = 'recipe_metadata'
    # recipe_id = models.IntegerField(max_length=6)
    # step_id = models.IntegerField(max_length=3)
    # recipe_image = models.ImageField(upload_to='/upload/recipe_image/', null=True, blank=True )