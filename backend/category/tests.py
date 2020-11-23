from django.test import TestCase
from rest_framework.test import APIRequestFactory,force_authenticate
from unittest.mock import patch
from django.core.management import call_command
from django.test import Client

from category.models import Category
from category.views import Category_view


# Create your tests here.

class CategoryTest(TestCase):

    def setUp(self):
        call_command("loaddata", "test_data.json",verbosity=0)
        self.factory = APIRequestFactory()

    # def setUp(self):
    #     Category.objects.create(category = "Sichuan Food", total_recipe = 0)
    #     self.factory = APIRequestFactory()

    def test_category_model(self):
        """Test the model of Category"""
        first_category = Category.objects.get(id = 1)
        self.assertEqual(first_category.category, "Breakfast")
        self.assertEqual(first_category.total_recipe, 23)

    def test_get_category_status_code(self):
        """Test the status code"""
        url = "/api/category/"      
        request = self.factory.get(url)
        my_view = Category_view.as_view()
        response = my_view(request)
        self.assertEqual(response.status_code, 200)

    def test_get_category_msg(self):
        """Test the getting method return value"""
        url = "/api/category/"      
        request = self.factory.get(url)
        my_view = Category_view.as_view()
        response = my_view(request)
        print(response.data['data'])
        self.assertEqual(response.data['code'], 100)
        self.assertEqual(response.data['msg'], "success")

    def test_get_category_data(self):
        """Test the getting method return value"""
        url = "/api/category/"      
        request = self.factory.get(url)
        my_view = Category_view.as_view()
        response = my_view(request)
        excepted_data = [{"id":1,"category":"Breakfast","total_recipe":23}, \
            {"id":2,"category":"Lunch","total_recipe":19}, \
                {"id":3,"category":"Dinner","total_recipe":29}, \
                    {"id":4,"category":"Meatlovers","total_recipe":27}, \
                        {"id":5,"category":"Vegetarian","total_recipe":17}, \
                            {"id":6,"category":"Asian","total_recipe":21}, \
                                {"id":7,"category":"Italian","total_recipe":18}, \
                                    {"id":8,"category":"Dessert","total_recipe":20}, \
                                        {"id":9,"category":"Seafood","total_recipe":22}]
        i = 0
        for category in response.data['data']:
            self.assertEqual(category, excepted_data[i])
            i += 1