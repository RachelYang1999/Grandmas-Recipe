from uauth.auth import UserAuth
from recipe.models import Recipe, Recipe_category
from category.models import Category

from rest_framework import status, exceptions
from rest_framework.views import APIView
from rest_framework.response import Response

import app_3609.util as util

class Search(APIView):

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
            # print(result_list)
            rst=util.get_response(100,"success",result_list)
            return Response(rst)
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
            # print(result_list)
            rst=util.get_response(100,"success",result_list)
            
            return Response(rst)
            
