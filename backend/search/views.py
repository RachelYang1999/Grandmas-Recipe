from uauth.auth import UserAuth
from django.shortcuts import render
from django.http import HttpResponse
# from search.serializers import SearchSerializer
from recipe_blog.models import Recipe
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
        
        # recipe_id=request.data.get("id")
        # if recipe_id is True:
        # recipe=Recipe.objects.get(id=recipe_id)
        get_title = recipe.recipe_title

        # category_type=request.data.get("category")
        # if category_type is True:
        #     c_recipe=Category.objects.get(category=category_type)
        #     get_total = c_recipe.total_recipe

        # category_id=request.data.get("id")
        # category=Category.objects.get(id=category_id)
        # get_category

        print(get_title)
        return Response("Search Success")
