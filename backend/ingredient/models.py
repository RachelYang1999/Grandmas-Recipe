from django.db import models

from recipe.models import Recipe
# from step.models import Step

# Create your models here.
class Ingredient(models.Model):
    class Meta:
        db_table = 'ingredient'

    ingredient_name = models.CharField(max_length = 100)
    ingredient_related_recipe = models.ForeignKey(Recipe, on_delete = models.CASCADE, related_name="ingredient_related_recipe")