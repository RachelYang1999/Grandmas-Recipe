from django.test import TestCase
from rest_framework.test import APIRequestFactory,force_authenticate
from unittest.mock import patch
from django.core.management import call_command
from django.test import Client

from step.models import Step
from recipe.models import Recipe

# Create your tests here.

class CategoryTest(TestCase):

    def setUp(self):
        call_command("loaddata", "test_data.json",verbosity=0)
        self.factory = APIRequestFactory()        

    def test_step_model(self):
        """Test the model of Step"""
        first_step = Step.objects.get(id = 1)

        self.assertEqual(first_step.step_description, "In a blender, combine soy milk, oats, banana and strawberries. ")
        self.assertEqual(first_step.related_recipe.recipe_title, "Strawberry Oatmeal Breakfast Smoothie")

