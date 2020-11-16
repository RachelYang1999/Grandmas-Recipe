from uauth.auth import UserAuth
from django.shortcuts import render
from django.http import HttpResponse
# from search.serializers import SearchSerializer
from recipe.models import Recipe, Recipe_category
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
        category_list =["hot", "test1","tttt","dinner", "meatlovers", "vegetarian", "asian", "western","dessert","seafood"]
        
        category_type=request.data.get("category")
        # From Category table get corresponding id of input category string  
        if category_type in category_list:
            # c_recipe is an object
            c_recipe=Category.objects.get(category=category_type.lower())
            c_id = c_recipe.id
            # find the line in Recipe_category table with corresponding recipe_id of input category (1 category -> many recipe)
            category_recipe_queryset = Recipe_category.objects.filter(category_of_recipe_id = c_id)
            
            # from Recipe_category table get recipe_of_category_id and find corresponding line in Recipe table and then get the corresponding id
            recipe_list =[]
            for c in category_recipe_queryset:
                recipe_list.append(Recipe.objects.get(id = c.recipe_of_category_id).id)
            # print(recipe_list)
            
            result_list = []
            for r in recipe_list:
                # print(r)
                get_title = Recipe.objects.get(id=r).recipe_title
                get_description = Recipe.objects.get(id=r).description
                get_update_date = Recipe.objects.get(id=r).update_date 
                get_userid =Recipe.objects.get(id=r).user_id
                result = {
                "title": get_title,
                "description": get_description,
                "update_date": get_update_date,
                "userid": get_userid,
                }
                result_list.append(result)
            print(result_list)
            return Response(result_list)
            # get_total = Recipe_category.category_of_recipe
            # c_recipe=Recipe_category.objects.filter(category_of_recipe=category_type.lower())
            # c_recipe=Recipe_category.objects.get(category_of_recipe=category_type.lower())
            # recipe_list =[]
            # for c in c_recipe:
            #     get_title = c.recipe_title
            #     get_description = c.description
            #     get_update_date = c.update_date 
            #     get_userid = c.user_id
            #     result = {
            #         "title": get_title,
            #         "description": get_description,
            #         "update_date": get_update_date,
            #         "userid": get_userid,
            #     }
            #     recipe_list.append(result)
            # return Response(recipe_list)
            # print(c_recipe)
            # get_total = c_recipe.total_recipe
            # print(get_total)
            # return Response(get_total)
        
        
        
        
        else:
            # search with title
            recipe_name=request.data.get("recipe_title")
            reicpe_queryset = Recipe.objects.filter(recipe_title__icontains = recipe_name)
            result_list = []
            for r in reicpe_queryset:
                get_title = r.recipe_title
                get_description = r.description
                get_update_date = r.update_date 
                get_userid = r.user_id
                result = {
                    "title": get_title,
                    "description": get_description,
                    "update_date": get_update_date,
                    "userid": get_userid,
                }
                result_list.append(result)
            print(result_list)
            
            return Response(result_list)
            # all_recipe = Recipe.objects.all()
            # queryset = Recipe.objects.filter(recipe_title = recipe_name)
            # name_list =[]
            # for n in queryset:
            #     name_list.append(Recipe.objects.get(recipe_title = n.recipe_title)
            # all_name = [x for x in ]
            # for r in all_recipe:
            #     print(r.filter(recipe_title = recipe_name))
            # Recipe.objects.filter(recipe_title = recipe_name)
            # result = Recipe.objects.filter(recipe_title = recipe_name)
            # n_recipe = Recipe.objects.get(recipe_title=recipe_name)
            # get_title = n_recipe.recipe_title
            # get_description = n_recipe.description
            # get_update_date = n_recipe.update_date 
            # get_userid = n_recipe.user_id
        
            # result = {
            #     "title": get_title,
            #     "description": get_description,
            #     "update_date": get_update_date,
            #     "userid": get_userid,
            # }
            # print(result)
            # # print(recipe_name)
            # # print(reicpe_queryset)
            # print(n_recipe)
            # print(recipe_name)
            # print(all_recipe)
            # print(query)
            # print(name_list)
            # print(result)
        
        
        # return Response(reicpe_queryset)

