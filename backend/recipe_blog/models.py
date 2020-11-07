from django.db import models

# Create your models here.
class Recipe(models.Model):
    class Meta:
        db_table = 'recipe'
    recipe_title = models.CharField(max_length=100)
