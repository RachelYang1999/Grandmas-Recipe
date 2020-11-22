from django.db import models

class Category(models.Model):
    class Meta:
        db_table = 'category'

    category = models.CharField(max_length=200)
    total_recipe = models.IntegerField(default=0)
