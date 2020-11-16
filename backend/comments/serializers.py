from comments.models import Comment
from rest_framework import serializers



class CommentSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Comment
        fields = ('id', 'comment_content', 'comment_publish_date','comment_recipe_id')
