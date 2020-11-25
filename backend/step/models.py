from django.db import models

from recipe.models import Recipe
# from step.models import Step

# Create your models here.
class Step(models.Model):
    class Meta:
        db_table = 'step'

    step_description = models.CharField(max_length = 1000)
    related_recipe = models.ForeignKey(Recipe, on_delete = models.CASCADE, related_name="related_recipe")
    step_image = models.ImageField(upload_to='step_image', null=True, blank=True,default="step_image/default.png")
