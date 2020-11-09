from uauth.auth import UserAuth
from django.shortcuts import render
from django.http import HttpResponse
from profiles.serializers import ProfileSerializer
from recipe.models import Recipe
from category.models import Category

from rest_framework import status, exceptions
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import viewsets


# Create your views here.

class RecipeView(APIView):
    # authentication_classes = (UserAuth,)
    # serializer_class = ProfileSerializer
    # user = User()

    def get(self, request):
        recipe_id = request.data.get("id")
        recipe = Recipe.objects.get(id = recipe_id)

        get_recipe_title = recipe.recipe_title
        get_recipe_description = recipe.description
        get_is_published = recipe.is_published
        get_update_date = recipe.update_date
        get_user_id = recipe.user_id

        get_recipe = {
            "title": get_recipe_title,
            "description": get_recipe_description,
            "is_published": get_is_published,
            "update_date": get_update_date,    
            "user_id": get_user_id,    
        }
        print(get_recipe)
        return Response("Recipe Get Success")

    def post(self, request):

        user_id = request.data.get("user_id")
        # current_user = User.objects.get(id = user_id)
        recipe_title = request.data.get("recipe_title")
        description =request.data.get("description")
        is_published = request.data.get("is_published")

        category = request.data.get("category")

        print("user_id" + user_id)
        print("recipe_title" + recipe_title)
        print("description" + description)
        print("is_published" + is_published)
        print("category" + category)

        if user_id != None and recipe_title != None and description != None and is_published != None and category != None:
            new_recipe = Recipe.objects.create(recipe_title = recipe_title, description = description, is_published = is_published, user_id = user_id)
            new_recipe.save()
            print("yes!!!")
        
        # if current_user != None:
        #     print("Cannot find the user")
        #     return
        # if recipe_title != None:
        #     recipe.introduction = post_introduction
        #     user.save()
        # if recipe_description != None:
        #     user.gender = post_gender
        #     user.save()


        # from_user = request.data.get('from_user')
        # to_user = request.data.get('to_user')

        # try:
        #     User_follow.objects.get(from_user=from_user, to_user=to_user)
        #     raise exceptions.ValidationError("user follow exist")
        # except User_follow.DoesNotExist:
        #     from_user_obj = User.objects.get(id=from_user)
        #     from_user_obj.total_following = from_user_obj.total_following+1
        #     from_user_obj.save()
        #     to_user_obj = User.objects.get(id=to_user)
        #     to_user_obj.total_follower = to_user_obj.total_follower+1
        #     to_user_obj.save()
        #     follow = User_follow.objects.create(from_user=from_user_obj, to_user=to_user_obj)
        #     follow.save()
        print("what!!!")
        data = {
            'msg': 'success',
        }
        return Response(data, status=201)
