from uauth.auth import UserAuth
from datetime import datetime
from django.shortcuts import render
from django.http import HttpResponse
from profiles.serializers import ProfileSerializer

from recipe.models import Recipe, Recipe_category
from category.models import Category
from user.models import User
from step.models import Step
from ingredient.models import Ingredient
from comments.models import Comment

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
        category_queryset = Recipe_category.objects.filter(recipe_of_category_id = recipe_id)
        step_queryset = Step.objects.filter(related_recipe_id = recipe_id)
        ingredient_queryset = Ingredient.objects.filter(ingredient_related_recipe_id = recipe_id)
        comment_all_queryset = Comment.objects.filter(comment_recipe_id = recipe_id)
        # print(Comment.objects.get(comment_recipe_id = recipe_id).comment_content)

        get_recipe_title = recipe.recipe_title
        get_recipe_description = recipe.description
        get_is_published = recipe.is_published
        get_update_date = recipe.update_date
        get_user_id = recipe.user_id
        get_user_name = User.objects.get(id = recipe.user_id).username

        get_category_list = []
        for c in category_queryset:
            get_category_list.append(Category.objects.get(id = c.category_of_recipe_id).category)
            # get_category_list.append(c.category_of_recipe_id)
            # print(c.category_of_recipe_id)

        get_step_list = []
        for s in step_queryset:
            get_step_list.append(s.step_description)

        get_ingredient_list = []
        for i in ingredient_queryset:
            get_ingredient_list.append(i.ingredient_name)

        get_comment_dic_list = []
        for c in comment_all_queryset:
            single_comment = {}
            single_comment['comment_user_id'] = c.comment_user_id
            single_comment['comment_user_name'] = User.objects.get(id = c.comment_user_id).username
            single_comment['comment_content'] = c.comment_content
            single_comment['comment_date'] = c.comment_publish_date.strftime('%Y-%m-%d')
            # print(single_comment)
            get_comment_dic_list.append(single_comment)

        get_recipe = {
            "title": get_recipe_title,
            "description": get_recipe_description,
            "is_published": get_is_published,
            "update_date": get_update_date,    
            "user_id": get_user_id,  
            "category_id_list": get_category_list, 
            "step_list": get_step_list,
            "ingredient_name_list": get_ingredient_list,
            "user_name": get_user_name,
            "comment_dic_list": get_comment_dic_list,
        }

        # print(get_recipe)
        return Response(get_recipe)

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

        # Save mutiple step inputs into a list
        step_decription_list = []
        step_count = request.data.get("step_count")
        for i in range(int(step_count)):
            step_number = i + 1
            input_step_name = "step-" + str(step_number)
            step_decription_list.append(request.data.get(input_step_name))

        # Save mutiple ingredient inputs into a list
        ingredient_name_list = []
        ingredient_count = request.data.get("ingredient_count")
        for i in range(int(ingredient_count)):
            ingredient_number = i + 1
            input_ingredient_name = "ingredient-" + str(ingredient_number)
            ingredient_name_list.append(request.data.get(input_ingredient_name))

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
            # Add ingredients for a recipe
            for i in ingredient_name_list:
                ingredient_object = Ingredient.objects.create(ingredient_name = i, ingredient_related_recipe_id = new_recipe.id)
                ingredient_object.save()

            # Add steps for a recipe
            for s in step_decription_list:
                step_object = Step.objects.create(step_description = s,	related_recipe_id = new_recipe.id)
                step_object.save()

            data = {
                'msg': 'success',
            }
            
        return Response(data, status=201)
