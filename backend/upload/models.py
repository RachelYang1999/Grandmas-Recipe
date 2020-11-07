from django.db import models
from user.models import User
from recipe_blog.models import Recipe

# Create your models here.
class Upload_profile(models.Model):
    class Meta:
        db_table = 'user_profile_metadata'
    user = models.ForeignKey(User, related_name='userprofileimage',on_delete=models.CASCADE,default=1)
    profile_image = models.ImageField(upload_to='avatar', null=True, blank=True,default="default.png")

class Upload_recipe(models.Model):
    class Meta:
        db_table = 'recipe_metadata'
    recipe = models.ForeignKey(Recipe, related_name='recipeimage',on_delete=models.CASCADE,default=1)
    step_id = models.IntegerField(default=1)
    recipe_image = models.ImageField(upload_to='recipe_image', null=True, blank=True )