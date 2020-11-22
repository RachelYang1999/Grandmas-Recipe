from django.db import models
from user.models import User
from recipe.models import Recipe


class Calendar(models.Model):
    class Meta:
        db_table = 'calendar'

    date = models.DateField()
    meal_type = models.CharField(max_length=30)
    recipe = models.ForeignKey(Recipe, related_name='recipe_cal',on_delete=models.CASCADE)
    user =models.ForeignKey(User, related_name='user_cal',on_delete=models.CASCADE)
