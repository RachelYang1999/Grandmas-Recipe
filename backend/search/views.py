from uauth.auth import UserAuth
from recipe.models import Recipe, Recipe_category, Recipe_mark
from category.models import Category
from user.models import User

from rest_framework import status, exceptions
from rest_framework.views import APIView
from rest_framework.response import Response

import app_3609.util as util

class Search(APIView):

    # authentication_classes = (UserAuth_POST,)
    
    # def post(self, request):
        
    #     user = request.user
    #     recipe_title = request.data.get("recipe_title")
    #     description =request.data.get("description")
    #     is_published = request.data.get("is_published")
    #     mark = request.data.get("mark")
    #     mark_list = ["hottest", "simplest", "newest"]
    #     mark_recipe = Recipe.objects.get(recipe_title = recipe_title, description = description, is_published = is_published, user = user)
    #     if mark.lower() in mark_list:

    #         add_recipe = Recipe_mark.objects.create(recipe = mark_recipe, mark = mark)
            
    #         data={
    #                 "recipe": mark_recipe.recipe_title,
    #                 "mark": add_recipe.mark
    #             }
    #         add_recipe.save()
    #         print(data)
            
    #     rst=util.get_response(100,"success",data)
    #     return Response(rst)

    def get(self, request):
        # search recipes for a user
        

        # mark_type = request.data.get("mark")
        category_type=request.data.get("category")
        recipe_name=request.data.get("recipe_title")

        # search recipes by mark
        
        # if mark_type!=None:
        #     mark_list = ["hottest", "newest", "simplest"]
            
        #     if mark_type != None:
        #         if mark_type in mark_list:
        #             try:
        #                 m_recipe=Recipe_mark.objects.filter(mark__icontains=mark_type.lower())
        #             except:
        #                 rst=util.get_response(100,"success",None)
        #                 return Response(rst)
                
        #             mark_result_list = []
        #             for r in m_recipe:
        #                 get_recipe = r.recipe
        #                 get_mark = r.mark

        #                 result = {
        #                     "recipe_user_id": get_recipe.user_id,
        #                     "recipe_id": get_recipe.id,
        #                     "recipe_title": get_recipe.recipe_title,
        #                     "recipe_description": get_recipe.description,
        #                     "recipe_update_date": get_recipe.update_date,
        #                     "mark": get_mark
        #                 }
        #                 mark_result_list.append(result)
                    
        #             rst=util.get_response(100,"success",mark_result_list)
        #             return Response(rst)
        # elif 
        if category_type!=None:
            # search by category
            category_list =["Breakfirst", "Lunch","Dinner", "Meatlovers", "Vegetarian", "Asian", "Italian","Dessert","Seafood"]
            
            # From Category table get corresponding id of input category string  
            if category_type!=None:
                if category_type in category_list:
                    # c_recipe is an object
                    try:
                        c_recipe=Category.objects.get(category__icontains=category_type.lower())
                    except:
                        rst=util.get_response(100,"success",None)
                        return Response(rst)

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
                        get_id=Recipe.objects.get(id=r).id
                        get_title = Recipe.objects.get(id=r).recipe_title
                        get_description = Recipe.objects.get(id=r).description
                        get_update_date = Recipe.objects.get(id=r).update_date 
                        get_userid =Recipe.objects.get(id=r).user_id
                        recipe_src = Recipe.objects.filter(id=r).values()[0]["intro_image"]
                        result = {
                        "id": get_id,
                        "title": get_title,
                        "description": get_description,
                        "update_date": get_update_date,
                        "recipe_src": recipe_src,
                        }
                        result_list.append(result)
                    # print(result_list)
                    rst=util.get_response(100,"success",result_list)
                    return Response(rst)

        elif recipe_name!=None:
            # search with title
            
            reicpe_queryset = Recipe.objects.filter(recipe_title__icontains = recipe_name)
            result_list = []
            for r in reicpe_queryset:
                get_id = r.id
                get_title = r.recipe_title
                get_description = r.description
                get_update_date = r.update_date 
                get_userid = r.user_id
                recipe_src = Recipe.objects.filter(id=r.id).values()[0]["intro_image"]
                result = {
                    "id":get_id,
                    "title": get_title,
                    "description": get_description,
                    "update_date": get_update_date,
                    "recipe_src": recipe_src,
                }
                result_list.append(result)
            # print(result_list)
            rst=util.get_response(100,"success",result_list)
        
            return Response(rst)

class Search_user(APIView):     
    authentication_classes = (UserAuth,)

    def get(self, request):

        user = request.user
        user_recipe = Recipe.objects.filter(user = user)
        user_recipe_list = []
        for r in user_recipe:
            u_recipe_id = r.id
            u_recipe_title = r.recipe_title
            u_recipe_description = r.description
            u_recipe_update_date = r.update_date
            recipe_src = Recipe.objects.filter(id=r.id).values()[0]["intro_image"]
            user_recipe_result = {
                "recipe_id": u_recipe_id,
                "recipe_title": u_recipe_title,
                "recipe_description": u_recipe_description,
                "recipe_update_date": u_recipe_update_date,
                "recipe_src": recipe_src,
            }
            user_recipe_list.append(user_recipe_result)
        
        rst=util.get_response(100,"success",user_recipe_list)
        return Response(rst)

        

        

    

            
