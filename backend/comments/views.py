from django.shortcuts import render
from django.http import HttpResponse
from django.core.files.storage import FileSystemStorage
from uauth.auth import UserAuth
from user.models import User
from recipe.models import Recipe
from comments.models import Comment
from comments.serializers import CommentSerializer

from django.core.cache import cache

from rest_framework import status, exceptions
from rest_framework.views import APIView
from rest_framework.response import Response

# Create your views here.
class Comment_view(APIView):
    serializer_class = CommentSerializer
    queryset = Comment.objects.all()
    authentication_classes = (UserAuth,)

    # def get(self, request, *args, **kwargs):
    #     recipe_id = request.data.get('recipe_id')
    #     comment_all = Comment.objects.filter(recipe_id=recipe_id)
    #     #print(comment_all.values())
    #     return Response(comment_all.values())
    
    def post(self, request, *args, **kwargs):
        comment_content = request.data.get('comment_content')
        user_name = request.data.get('user_name')
        # user_id = User.objects.get(user_name = user_name).id
        user = User.objects.get(username = user_name)
        recipe_name = request.data.get('recipe_name')
        recipe = Recipe.objects.get(recipe_title=recipe_name)
        new_entry = Comment.objects.create(comment_user = user, comment_content = comment_content, comment_recipe = recipe)
        return Response('success')
