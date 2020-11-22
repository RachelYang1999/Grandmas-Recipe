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
        self.assertEqual(first_category.category, "Breakfirst")
        self.assertEqual(first_category.total_recipe, 0)

    def test_get_category_status_code(self):
        """Test the getting method of Category"""
        url = "/api/category/"      
        request = self.factory.get(url)
        my_view = Category_view.as_view()
        response = my_view(request)
        self.assertEqual(response.status_code, 200)

    def test_get_category_msg(self):
        """Test the getting method of Category"""
        url = "/api/category/"      
        request = self.factory.get(url)
        my_view = Category_view.as_view()
        response = my_view(request)
        self.assertEqual(response.data['code'], 100)








    # def setUp(self):
    #     call_command("loaddata", "test_data.json",verbosity=0)

    #     self.factory = APIRequestFactory()

    #     url = "/api/auth/"      
    #     request=self.factory.post(url,{"username":"root","password":"root"})
    #     view=User_auth.as_view()
    #     response = view(request)
    #     self.token=response.data["data"]["token"]


    # def test_uauth_get(self):
    #     view = User_auth.as_view()
    #     user = User.objects.get(id=1)

    #     url = "/api/auth/"      
    #     request = self.factory.get(url)

    #     force_authenticate(request, user=user)

    #     response = view(request)
    #     exp={'username': 'root', 'avatar': 'avatar/default.png'}

    #     rst= response.data["data"]

    #     self.assertEqual(rst, exp)


