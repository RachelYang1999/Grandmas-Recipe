from uauth.auth import UserAuth
from django.shortcuts import render
from django.http import HttpResponse
from profiles.serializers import ProfileSerializer
from recipe.models import Recipe, Recipe_category
from category.models import Category

from rest_framework import status, exceptions
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import viewsets

from django.db import transaction

class RecipeView(APIView):
    authentication_classes = (UserAuth,)

    def get(self, request):
        recipe_id = request.data.get("id")
        recipe = Recipe.objects.get(id = recipe_id)
        category = Recipe_category.objects.get(recipe_of_category_id = recipe_id)

        get_recipe_title = recipe.recipe_title
        get_recipe_description = recipe.description
        get_is_published = recipe.is_published
        get_update_date = recipe.update_date
        get_user_id = recipe.user_id
        get_category = category

        get_recipe = {
            "title": get_recipe_title,
            "description": get_recipe_description,
            "is_published": get_is_published,
            "update_date": get_update_date,    
            "user_id": get_user_id,  
            "category_id": get_category  
        }
        print(get_recipe)
        return Response("Recipe Get Success")

    @transaction.non_atomic_requests
    def post(self, request):

        user = request.user
        # current_user = User.objects.get(id = user_id)
        recipe_title = request.data.get("recipe_title")
        description =request.data.get("description")
        is_published = request.data.get("is_published")

        category = request.data.get("category")

        if recipe_title != None and description != None and is_published != None and category != None:
            new_recipe = Recipe.objects.create(recipe_title = recipe_title, description = description, is_published = is_published, user = user)
            new_recipe.save()
            print("yes!!!")

            if Category.objects.get(id = category) == None:
                raise exceptions.ValidationError("Sorry, we don't have this category")
            
            # Add the total number of recipe amount of a category
            category_object = Category.objects.get(id = category)
            category_object.total_recipe = category_object.total_recipe + 1
            category_object.save()
            
            recipe_id = new_recipe.id
            modify_recipe_category = Recipe_category.objects.create(category_of_recipe_id = category, recipe_of_category_id = recipe_id)
            modify_recipe_category.save()

        data = {
            'msg': 'success',
        }
        return Response(data, status=201)
