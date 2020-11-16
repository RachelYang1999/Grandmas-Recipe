
from uauth.auth import UserAuth
from user.models import User
from recipe.models import Recipe
from comments.models import Comment

from django.core.cache import cache

from rest_framework import status, exceptions
from rest_framework.views import APIView
from rest_framework.response import Response

import app_3609.util as util

# Create your views here.
class Comment_view(APIView):

    authentication_classes = (UserAuth,)

    # def get(self, request, *args, **kwargs):
    #     recipe_id = request.data.get('recipe_id')
    #     comment_all = Comment.objects.filter(recipe_id=recipe_id)
    #     #print(comment_all.values())
    #     return Response(comment_all.values())
    
    def post(self, request, *args, **kwargs):
        comment_content = request.data.get('comment_content')
        # user_name = request.data.get('user_name')
        # user_id = User.objects.get(user_name = user_name).id
        user = request.user
        recipe_id = request.data.get('recipe_id')
        recipe = Recipe.objects.get(id=recipe_id)
        new_entry = Comment.objects.create(comment_user = user, comment_content = comment_content, comment_recipe = recipe)

        rst=util.get_response(100,"success",None)
        return Response(rst)
