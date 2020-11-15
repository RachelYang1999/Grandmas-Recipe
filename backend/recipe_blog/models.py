from django.db import models

# Create your models here.
class Recipe(models.Model):
    class Meta:
        db_table = 'recipe'

    recipe_title = models.CharField(max_length=100)
    description = models.CharField(max_length=1000)
    update_date = models.DateField(auto_now_add=True)
    is_published = models.IntegerField(default=0)
    

