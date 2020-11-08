from django.db import models
from user.models import User
from recipe_blog.models import Recipe
# Create your models here
class Comment(models.Model):
    class Meta:
        db_table = 'comment'
    comment_content = models.CharField(max_length=500)
    publish_date = models.DateTimeField(auto_now_add=True)
    recipe = models.ForeignKey(Recipe, related_name='referenceRecipe',on_delete=models.CASCADE,default=1)
    user = models.ForeignKey(User, related_name='referenceUser',on_delete=models.CASCADE,default=1)

