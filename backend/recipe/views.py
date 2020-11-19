from uauth.auth import UserAuth
from datetime import datetime
from recipe.models import Recipe, Recipe_category, Recipe_mark,Recipe_favourite
from category.models import Category
from user.models import User
from step.models import Step
from ingredient.models import Ingredient

from comments.models import Comment

from rest_framework import status, exceptions
from rest_framework.views import APIView
from rest_framework.response import Response

import app_3609.util as util


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

        get_recipe_id = recipe.id

        get_recipe_title = recipe.recipe_title
        get_recipe_description = recipe.description
        get_is_published = recipe.is_published
        get_update_date = recipe.update_date
        get_user_id = recipe.user_id
        get_user_name = User.objects.get(id = recipe.user_id).username
        get_recipe_src=Recipe.objects.filter(id=recipe.id).values()[0]["intro_image"]
        

        get_category_list = []
        for c in category_queryset:
            get_category_list.append(Category.objects.get(id = c.category_of_recipe_id).id)
            # get_category_list.append(c.category_of_recipe_id)
            # print(c.category_of_recipe_id)

        get_step_list = []
        for s in step_queryset:
            get_step_list.append((s.step_description,Step.objects.filter(id=s.id).values()[0]["step_image"]))

        get_ingredient_list = []
        for i in ingredient_queryset:
            get_ingredient_list.append((i.ingredient_name,i.ingredient_link))

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
            "id": get_recipe_id,
            "intro_src": get_recipe_src,
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
        rst=util.get_response(100,"success",get_recipe)
        return Response(rst)

    def post(self, request):
        
        user = request.user
        # current_user = User.objects.get(id = user_id)
        recipe_title = request.data.get("recipe_title")
        description =request.data.get("description")
        is_published = request.data.get("is_published")

        category = request.data.get("category")
        category_list = category.split(",")

        for c in category_list:
            try:
                category_object = Category.objects.get(id = c)
            except:
                rst=util.get_response(400,"You must choose at least one category!",None)
                return Response(rst)

        # Save mutiple step inputs into a list
        step_decription_list = []
        step_count = request.data.get("step_count")
        for i in range(int(step_count)):
            step_number = i + 1
            input_step_name = "step-" + str(step_number)
            step_decription_list.append(request.data.get(input_step_name))
        print(step_decription_list)

        # Save mutiple ingredient inputs into a list
        ingredient_name_list = []
        ingredient_link_list = []
        ingredient_count = request.data.get("ingredient_count")
        print(ingredient_count)
        for i in range(int(ingredient_count)):
            ingredient_number = i + 1
            input_ingredient_name = "ingredient-" + str(ingredient_number)
            ingredient_name_list.append(request.data.get(input_ingredient_name))
            input_ingredient_link = "ingredient-" + str(ingredient_number)+"-shoppinglink"
            ingredient_link_list.append(request.data.get(input_ingredient_link))
            print(ingredient_link_list)

        if recipe_title != None and description != None and is_published != None and category != None:

            new_recipe = Recipe.objects.create(recipe_title = recipe_title, description = description, is_published = is_published, user = user)
            new_recipe.save()
            
            # Add the total number of recipe amount of a category
            # Add categories for a recipe  
            for c in category_list:
                category_object = Category.objects.get(id = c)
                category_object.total_recipe = category_object.total_recipe + 1
                category_object.save()
                recipe_category_relationship = Recipe_category.objects.create(category_of_recipe_id = c, recipe_of_category_id = new_recipe.id)
                recipe_category_relationship.save()

            # Add ingredients for a recipe
            for i in range(0,len(ingredient_name_list)):
                ingredient_object = Ingredient.objects.create(ingredient_name = ingredient_name_list[i],ingredient_related_recipe_id = new_recipe.id, ingredient_link=ingredient_link_list[i])
                ingredient_object.save()

            # Add steps for a recipe
            step_rtv={}
            count=1
            for s in step_decription_list:
                step_object = Step.objects.create(step_description = s,	related_recipe_id = new_recipe.id)
                step_object.save()
                step_rtv[count]=step_object.id
                count+=1

            data={
                "recipe_id":new_recipe.id,
                "steps": step_rtv
            }
            
            rst=util.get_response(100,"success",data)
            return Response(rst)

class RecipeIndexView(APIView):
    def get(self, request):
        position = request.data.get("position")
        recipes=Recipe_mark.objects.filter(mark=position)
        data=[]
        for r in recipes:
            temp={}
            temp["id"]=r.recipe_id

            temp["title"]=Recipe.objects.get(id=r.recipe_id).recipe_title

            meta=Recipe.objects.filter(id=r.recipe_id).values()[0]["intro_image"]
            # print(meta)
            
            temp["meta"]=meta
            data.append(temp)

        rst=util.get_response(100,"success",data)

        return Response(rst)

class RecipeFavView(APIView):
    authentication_classes = (UserAuth,)

    def post(self, request):
        recipe_id = request.data.get("recipe_id")
        recipe=Recipe.objects.get(id=recipe_id)
        user=request.user
       
        try:
            Recipe_favourite.objects.get(user=user, recipe=recipe)
            return Response(util.get_response(400,"favourite recipe exist",None))
        except Recipe_favourite.DoesNotExist:
            new_recipe = Recipe_favourite.objects.create(user=user, recipe=recipe)
            

        rst=util.get_response(100,"success",None)

        return Response(rst)

    def get(self, request):
        user = request.user
        recipes=Recipe_favourite.objects.filter(user=user).values()

        print(recipes)
        data=[]
        for r in recipes:
            temp={}
            temp["id"]=r["recipe_id"]
            temp["description"]=Recipe.objects.get(id=r["recipe_id"]).description

            temp["title"]=Recipe.objects.get(id=r["recipe_id"]).recipe_title

            meta=Recipe.objects.filter(id=r["recipe_id"]).values()[0]["intro_image"]
            # print(meta)
            
            temp["meta"]=meta
            data.append(temp)

        rst=util.get_response(100,"success",data)

        return Response(rst)


class RecipeEditView(APIView):

    authentication_classes = (UserAuth,)

    def post(self, request):
        
        user = request.user
        recipe_id = request.data.get("recipe_id")
        # current_user = User.objects.get(id = user_id)
        recipe_title = request.data.get("recipe_title")
        description =request.data.get("description")
        is_published = request.data.get("is_published")

        category = request.data.get("category")
        category_list = category.split(",")

        for c in category_list:
            try:
                category_object = Category.objects.get(id = c)
            except:
                rst=util.get_response(400,"You must choose at least one category!",None)
                return Response(rst)

        # Save mutiple step inputs into a list
        step_decription_list = []
        step_count = request.data.get("step_count")
        for i in range(int(step_count)):
            step_number = i + 1
            input_step_name = "step-" + str(step_number)
            step_decription_list.append(request.data.get(input_step_name))
        print(step_decription_list)

        # Save mutiple ingredient inputs into a list
        ingredient_name_list = []
        ingredient_link_list = []
        ingredient_count = request.data.get("ingredient_count")
        print(ingredient_count)
        for i in range(int(ingredient_count)):
            ingredient_number = i + 1
            input_ingredient_name = "ingredient-" + str(ingredient_number)
            ingredient_name_list.append(request.data.get(input_ingredient_name))
            input_ingredient_link = "ingredient-" + str(ingredient_number)+"-shoppinglink"
            ingredient_link_list.append(request.data.get(input_ingredient_link))
            print(ingredient_link_list)

        if recipe_title != None and description != None and is_published != None and category != None:

            new_recipe = Recipe.objects.create(recipe_title = recipe_title, description = description, is_published = is_published, user = user)
            new_recipe.save()
            
            # Add the total number of recipe amount of a category
            # Add categories for a recipe  
            for c in category_list:
                category_object = Category.objects.get(id = c)
                category_object.total_recipe = category_object.total_recipe + 1
                category_object.save()
                recipe_category_relationship = Recipe_category.objects.create(category_of_recipe_id = c, recipe_of_category_id = new_recipe.id)
                recipe_category_relationship.save()

            # Add ingredients for a recipe
            for i in range(0,len(ingredient_name_list)):
                ingredient_object = Ingredient.objects.create(ingredient_name = ingredient_name_list[i],ingredient_related_recipe_id = new_recipe.id, ingredient_link=ingredient_link_list[i])
                ingredient_object.save()

            # Add steps for a recipe
            step_rtv={}
            count=1
            for s in step_decription_list:
                step_object = Step.objects.create(step_description = s,	related_recipe_id = new_recipe.id)
                step_object.save()
                step_rtv[count]=step_object.id
                count+=1

            data={
                "recipe_id":new_recipe.id,
                "steps": step_rtv
            }
            
            rst=util.get_response(100,"success",data)
            return Response(rst)