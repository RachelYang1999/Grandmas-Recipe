from django.db import models
from user.models import User
from recipe.models import Recipe
# Create your models here
class Comment(models.Model):
    class Meta:
        db_table = 'comment'
    comment_content = models.CharField(max_length=500)
    comment_publish_date = models.DateTimeField(auto_now_add=True)
    comment_recipe = models.ForeignKey(Recipe, related_name='referenceRecipe',on_delete=models.CASCADE,default=1)
    comment_user = models.ForeignKey(User, related_name='referenceUser',on_delete=models.CASCADE,default=1)

