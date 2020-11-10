from uauth.auth import UserAuth
from django.shortcuts import render
from django.http import HttpResponse
from profiles.serializers import ProfileSerializer
from recipe.models import Recipe, Recipe_category
from category.models import Category
from step.models import Step

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
        category = Recipe_category.objects.filter(recipe_of_category_id = recipe_id)
        step = Step.objects.filter(related_recipe_id = recipe_id)

        get_recipe_title = recipe.recipe_title
        get_recipe_description = recipe.description
        get_is_published = recipe.is_published
        get_update_date = recipe.update_date
        get_user_id = recipe.user_id

        get_category_list = []
        for c in category:
            get_category_list.append(c.category_of_recipe_id)
            # print(c.category_of_recipe_id)

        get_step_list = []
        for s in step:
            get_step_list.append(s.step_description)

        get_recipe = {
            "title": get_recipe_title,
            "description": get_recipe_description,
            "is_published": get_is_published,
            "update_date": get_update_date,    
            "user_id": get_user_id,  
            "category_id_list": get_category_list, 
            "step_id_list": get_step_list,
        }

        print(get_recipe)
        return Response("Recipe Get Success")

    @transaction.non_atomic_requests
    def post(self, request):
        data = {
                'msg': 'failed',
            }
        user = request.user
        # current_user = User.objects.get(id = user_id)
        recipe_title = request.data.get("recipe_title")
        description =request.data.get("description")
        is_published = request.data.get("is_published")

        category = request.data.get("category")
        category_list = category.split(",")
        print(category_list)

        step_decription_list = []
        step_count = request.data.get("step_count")
        for i in range(int(step_count)):
            step_number = i + 1
            input_step_name = "step-" + str(step_number)
            step_decription_list.append(request.data.get(input_step_name))

        if recipe_title != None and description != None and is_published != None and category != None:

            new_recipe = Recipe.objects.create(recipe_title = recipe_title, description = description, is_published = is_published, user = user)
            new_recipe.save()
            
            # Add the total number of recipe amount of a category
            # Add categories for a recipe  
            category_not_found = ""
            for c in category_list:
                try:
                    category_object = Category.objects.get(id = c)
                    category_object.total_recipe = category_object.total_recipe + 1
                    category_object.save()
                    recipe_category_relationship = Recipe_category.objects.create(category_of_recipe_id = c, recipe_of_category_id = new_recipe.id)
                    recipe_category_relationship.save()
                except:
                    category_not_found += c
                    data = {
                        'msg': category_not_found + " category is not found",
                    }
                    return Response(data, status=201)

                # category_object = Category.objects.get(id = c)
                # category_object.total_recipe = category_object.total_recipe + 1
                # category_object.save()
                # recipe_category_relationship = Recipe_category.objects.create(category_of_recipe_id = c, recipe_of_category_id = new_recipe.id)
                # recipe_category_relationship.save()

            # Add steps for a recipe
            for s in step_decription_list:
                step_object = Step.objects.create(step_description = s, related_recipe_id = new_recipe.id)
                step_object.save()

            data = {
                'msg': 'success',
            }
            
        return Response(data, status=201)
