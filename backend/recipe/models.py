from django.db import models

from user.models import User
from category.models import Category

# Create your models here.
class Recipe(models.Model):
    class Meta:
        db_table = 'recipe'

    recipe_title = models.CharField(max_length = 100)
    description = models.CharField(max_length = 1000)
    update_date = models.DateField(auto_now_add=True, blank=True)
    is_published = models.IntegerField(default = 0)
    intro_image = models.ImageField(upload_to='intro_image', null=True, blank=True,default="intro_image/default.png")
    user = models.ForeignKey(User, on_delete = models.CASCADE, related_name="recipe_user")

class Recipe_category(models.Model):
    class Meta:
        db_table = 'recipe_category'

    recipe_of_category =  models.ForeignKey(Recipe, related_name='recipe_of_category', on_delete = models.CASCADE)
    category_of_recipe =  models.ForeignKey(Category, related_name='category_of_recipe', on_delete = models.CASCADE)

class Recipe_mark(models.Model):
    class Meta:
        db_table = 'recipe_mark'

    recipe =  models.ForeignKey(Recipe, related_name='recipe_mark', on_delete = models.CASCADE)
    mark =  models.CharField(max_length = 100)