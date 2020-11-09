from uauth.auth import UserAuth
from django.shortcuts import render
from django.http import HttpResponse
from profiles.serializers import ProfileSerializer
from recipe.models import Recipe

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

        get_recipe = {
            "title": get_recipe_title,
            "description": get_recipe_description,
            "is_published": get_is_published,
            "update_date": get_update_date,        
        }
        print(get_recipe)
        return Response("Recipe Get Success")
    
