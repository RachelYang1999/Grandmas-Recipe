from django.db import models


class Calendar(models.Model):
    class Meta:
        db_table = 'calendar'

    date = models.DateField(auto_now_add=True)
    meal_type = models.CharField(max_length=30)
    # recipe_id = models.IntegerField(default=0)
