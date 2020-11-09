from django.db import models

from user.models import User
from category.models import Category

# Create your models here.
class Recipe(models.Model):
    class Meta:
        db_table = 'recipe'

    recipe_title = models.CharField(max_length = 100)
    description = models.CharField(max_length = 1000)
    update_date = models.DateField(auto_now_add = True)
    is_published = models.IntegerField(default = 0)

    user = models.ForeignKey(User, on_delete = models.CASCADE, default = 1)
    # category = models.ManyToManyField(Category, default = 1)

class Recipe_category(models.Model):
    class Meta:
        db_table = 'recipe_category'

    recipe_id =  models.ForeignKey(Recipe, on_delete = models.CASCADE)
    category_id =  models.ForeignKey(Category, on_delete = models.CASCADE)
