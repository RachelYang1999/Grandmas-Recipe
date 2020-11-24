from django.test import TestCase
from rest_framework.test import APIRequestFactory,force_authenticate
from unittest.mock import patch
from django.core.management import call_command
from django.test import Client

from comments.models import Comment
from recipe.models import Recipe
from recipe.views import RecipeView
from recipe.views import RecipeIndexView
from recipe.views import RecipeFavView
from recipe.views import RecipeEditView

from ingredient.models import Ingredient
from category.models import Category
from user.models import User
from uauth.views import User_auth
from profiles.views import Profiles


class RecipeTest(TestCase):

    def setUp(self):
        call_command("loaddata", "test_data.json",verbosity=0)
        self.factory = APIRequestFactory()
        Recipe.objects.create(\
            recipe_title = "pasta",\
                description = "It is really easy to learn",\
                    is_published = 1,\
                        user = User.objects.get(id = 1)
            )

    def test_recipe_model(self):
        recipe = Recipe.objects.get(id = 1)
        self.assertEqual(recipe.recipe_title, "Strawberry Oatmeal Breakfast Smoothie")
        self.assertEqual(recipe.description, "This is a fast vegan smoothie with a deep pink color and a rich, creamy texture. VERY filling, and perfect for people in a rush in the morning. You don't have to give up a good breakfast when it's this fast to make! I use vitamin fortified soy milk.")
        self.assertEqual(recipe.intro_image, "intro_image/smt_tfqtXYU.png")
        self.assertEqual(recipe.is_published, 1)

    def test_get_recipe_without_login(self):
        """Test get recipe without auth"""
        view = RecipeView.as_view()
        url = "/api/recipe/" 
        request = self.factory.get(url, {"id": 1})
        response = view(request)
        self.assertEqual(response.status_code, 403)


    # def test_get_recipe(self):
    #     """Test get recipe after logging in"""
    #     login_url = "/api/auth/"      
    #     login_request = self.factory.post(login_url,{"username":"root","password":"root"})
    #     login_view = User_auth.as_view()
    #     login_response = login_view(login_request)
    #     self.token = login_response.data["data"]["token"]

    #     user = User.objects.get(id = 1)

    #     recipe_url = "/api/recipe/"      
    #     recipe_request = self.factory.get(recipe_url)

    #     # recipe_request = self.factory.get(recipe_url, {"id": 1})

    #     force_authenticate(recipe_request, user=user)
    #     recipe_view = RecipeView.as_view()
    #     recipe_response = recipe_view(recipe_request)
    #     self.assertEqual(recipe_response.status_code, 200)

    def test_post_recipe_without_login(self):
        """Test post recipe without auth"""
        view = RecipeView.as_view()
        recipe_url = "/api/recipe/"      
        recipe_request = self.factory.post(recipe_url, {"recipe_title": "Noodles", \
            "description": "Nice",\
                "is_published": 1,\
                    "category": "Lunch,Dinner",\
                        "step_count": 2,\
                            "step-1": "Boil",\
                                "step-2": "fry",\
                                    "ingredient_count": 2,\
                                        "ingredient-1": "salt",\
                                            "ingredient-1-shoppinglink": "linka",\
                                                "ingredient-2": "ingredient",\
                                                    "ingredient-2-shoppinglink": "linkb"})
        response = view(recipe_request)
        self.assertEqual(response.status_code, 403)

    def test_post_recipe_success(self):
        """Test post after logging in"""
        login_url = "/api/auth/"      
        login_request = self.factory.post(login_url,{"username":"root","password":"root"})
        login_view = User_auth.as_view()
        login_response = login_view(login_request)
        self.token = login_response.data["data"]["token"]

        user = User.objects.get(id = 1)

        recipe_url = "/api/recipe/"      
        recipe_request = self.factory.post(recipe_url, {"recipe_title": "Noodles", \
            "description": "Nice",\
                "is_published": 1,\
                    "category": "Lunch,Dinner",\
                        "step_count": 2,\
                            "step-1": "Boil",\
                                "step-2": "fry",\
                                    "ingredient_count": 2,\
                                        "ingredient-1": "salt",\
                                            "ingredient-1-shoppinglink": "linka",\
                                                "ingredient-2": "ingredient",\
                                                    "ingredient-2-shoppinglink": "linkb"})
        force_authenticate(recipe_request, user=user)
        recipe_view = RecipeView.as_view()
        recipe_response = recipe_view(recipe_request)
        self.assertEqual(recipe_response.status_code, 200)

class RecipeIndexViewTest(TestCase):
    def setUp(self):
        call_command("loaddata", "test_data.json",verbosity=0)
        self.factory = APIRequestFactory()
        Recipe.objects.create(\
            recipe_title = "pasta",\
                description = "It is really easy to learn",\
                    is_published = 1,\
                        user = User.objects.get(id = 1)
            )

    def test_get_hottest(self):
        """Test get recipe without auth"""
        view = RecipeIndexView.as_view()
        url = "/api/index_recipe/" 
        request = self.factory.get(url, {"position": "hottest"})
        response = view(request)
        self.assertEqual(response.status_code, 200)

        # Test return code and msg
        returned_code = response.data['code']
        returned_msg = response.data['msg']
        self.assertEqual(returned_code, 100)
        self.assertEqual(returned_msg, "success")

        expected_first_data = {"id": 6, "title": "advsd", "meta": "intro_image/ttt.jpg"}
        # returned_first_data = response.data['data'][0]
        print(len(response.data['data']))

        # self.assertEqual(returned_first_data, expected_first_data)
    
class RecipeFavViewTest(TestCase):
    def setUp(self):
        call_command("loaddata", "test_data.json",verbosity=0)
        self.factory = APIRequestFactory()
        Recipe.objects.create(\
            recipe_title = "pasta",\
                description = "It is really easy to learn",\
                    is_published = 1,\
                        user = User.objects.get(id = 1)
            )

    def test_post_fav_without_login(self):
        view = RecipeFavView.as_view()
        url = "/api/fav_recipe/"      
        recipe_request = self.factory.post(url, {"recipe_id": 1})
        response = view(recipe_request)
        self.assertEqual(response.status_code, 403)

    def test_post_fav_success(self):
        """Test post after logging in"""
        login_url = "/api/auth/"      
        login_request = self.factory.post(login_url,{"username":"root","password":"root"})
        login_view = User_auth.as_view()
        login_response = login_view(login_request)
        self.token = login_response.data["data"]["token"]

        user = User.objects.get(id = 1)

        recipe_url = "/api/fav_recipe/"    
        #Test fav recipe already exists  
        recipe_request = self.factory.post(recipe_url, {"recipe_id": 1})
        force_authenticate(recipe_request, user=user)
        recipe_view = RecipeFavView.as_view()
        recipe_response = recipe_view(recipe_request)
        self.assertEqual(recipe_response.status_code, 200)

         # Test return code and msg
        returned_code = recipe_response.data['code']
        returned_msg = recipe_response.data['msg']
        self.assertEqual(returned_code, 400)
        self.assertEqual(returned_msg, "favourite recipe exist")

class RecipeEditViewTest(TestCase):

    def setUp(self):
        call_command("loaddata", "test_data.json",verbosity=0)
        self.factory = APIRequestFactory()

    def test_edit_without_login(self):
        view = RecipeEditView.as_view()
        recipe_url = "/api/edit_recipe/"      
        recipe_request = self.factory.post(recipe_url, {"recipe_id": 1, "recipe_title": "Noodles", \
            "description": "Nice",\
                "is_published": 1,\
                    "category": "Lunch,Dinner",\
                        "step_count": 2,\
                            "step-1": "Boil",\
                                "step-2": "fry",\
                                    "ingredient_count": 2,\
                                        "ingredient-1": "salt",\
                                            "ingredient-1-shoppinglink": "linka",\
                                                "ingredient-2": "ingredient",\
                                                    "ingredient-2-shoppinglink": "linkb"})
        response = view(recipe_request)
        self.assertEqual(response.status_code, 403)

    def test_edit_success(self):

        """Test post after logging in"""
        login_url = "/api/auth/"      
        login_request = self.factory.post(login_url,{"username":"root","password":"root"})
        login_view = User_auth.as_view()
        login_response = login_view(login_request)
        self.token = login_response.data["data"]["token"]

        user = User.objects.get(id = 1)

        view = RecipeEditView.as_view()
        recipe_url = "/api/edit_recipe/"      
        recipe_request = self.factory.post(recipe_url, {"recipe_id": 1, "recipe_title": "Noodles", \
            "description": "Nice",\
                "is_published": 1,\
                    "category": "Dinner,Lunch,Seafood",\
                        "step_count": 2,\
                            "step-1": "Boil",\
                                "step-2": "fry",\
                                    "ingredient_count": 2,\
                                        "ingredient-1": "salt",\
                                            "ingredient-1-shoppinglink": "linka",\
                                                "ingredient-2": "ingredient",\
                                                    "ingredient-2-shoppinglink": "linkb"})
        force_authenticate(recipe_request, user=user)

        recipe_response = view(recipe_request)
        self.assertEqual(recipe_response.status_code, 200)

    def test_edit_no_category(self):

        """Test post after logging in"""
        login_url = "/api/auth/"      
        login_request = self.factory.post(login_url,{"username":"root","password":"root"})
        login_view = User_auth.as_view()
        login_response = login_view(login_request)
        self.token = login_response.data["data"]["token"]

        user = User.objects.get(id = 1)

        view = RecipeEditView.as_view()
        recipe_url = "/api/edit_recipe/"      
        recipe_request = self.factory.post(recipe_url, {"recipe_id": 1, "recipe_title": "Noodles", \
            "description": "Nice",\
                "is_published": 1,\
                    "category": "",\
                        "step_count": 2,\
                            "step-1": "Boil",\
                                "step-2": "fry",\
                                    "ingredient_count": 2,\
                                        "ingredient-1": "salt",\
                                            "ingredient-1-shoppinglink": "linka",\
                                                "ingredient-2": "ingredient",\
                                                    "ingredient-2-shoppinglink": "linkb"})
        force_authenticate(recipe_request, user=user)

        recipe_response = view(recipe_request)
        self.assertEqual(recipe_response.status_code, 200)

        # Test return code and msg
        returned_code = recipe_response.data['code']
        returned_msg = recipe_response.data['msg']
        self.assertEqual(returned_code, 400)
        self.assertEqual(returned_msg, "You must choose at least one category!")
             



    





