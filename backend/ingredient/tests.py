from django.test import TestCase
from rest_framework.test import APIRequestFactory,force_authenticate
from unittest.mock import patch
from django.core.management import call_command
from django.test import Client

from ingredient.models import Ingredient
from recipe.models import Recipe
from user.models import User

# Create your tests here.

class CategoryTest(TestCase):

    def setUp(self):
        call_command("loaddata", "test_data.json",verbosity=0)
        self.factory = APIRequestFactory()

        Recipe.objects.create(\
            recipe_title = "pasta",\
                description = "It is really easy to learn",\
                    is_published = 1,\
                        user = User.objects.get(id = 1)
            )

        Ingredient.objects.create(ingredient_name = "milk", ingredient_link = \
            "https://shop.coles.com.au/a/national/product/sanitarium-so-good-milk-long-life-soy-regular-403029p?adId=display_DtLwZdDP-tNJSUJSu6HyfyLtNI80MDMwMjlQ",\
                ingredient_related_recipe = Recipe.objects.get(id = 1))

    def test_ingredient_model(self):

        """Test the model of Ingredient"""
        ingredient = Ingredient.objects.get(id = 1)

        self.assertEqual(ingredient.ingredient_name, "milk")
        self.assertEqual(ingredient.ingredient_link, \
            "https://shop.coles.com.au/a/national/product/sanitarium-so-good-milk-long-life-soy-regular-403029p?adId=display_DtLwZdDP-tNJSUJSu6HyfyLtNI80MDMwMjlQ")
        self.assertEqual(ingredient.ingredient_related_recipe.id, 1)

