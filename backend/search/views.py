from uauth.auth import UserAuth
from django.shortcuts import render
from django.http import HttpResponse
# from search.serializers import SearchSerializer
from recipe.models import Recipe
from category.models import Category

from rest_framework import status, exceptions
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import viewsets

# Create your views here.

class Search(APIView):
    # authentication_classes = (UserAuth,)
    # serializer_class = SearchSerializer

    # get recipe

    def get(self, request):
        category_list =["hot", "test"]
        
        category_type=request.data.get("category")
        if category_type in category_list:
            c_recipe=Category.objects.get(category=category_type)
            get_total = c_recipe.total_recipe
            print(get_total)
        else:
            recipe_name=request.data.get("recipe_title")
            n_recipe=Recipe.objects.get(recipe_title=recipe_name)
            get_title = n_recipe.recipe_title
            get_description = n_recipe.description
            get_update_date = n_recipe.update_date 
            get_userid = n_recipe.user_id
            
            result = {
                "title": get_title,
                "description": get_description,
                "update_date": get_update_date,
                "userid": get_userid,
            }
            print(result)
        
        return Response("Search Success")
