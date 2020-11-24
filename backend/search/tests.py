from django.test import TestCase

from rest_framework.test import APIRequestFactory,force_authenticate
from unittest.mock import patch
from django.core.management import call_command
from django.test import Client

from recipe.models import Recipe
from user.models import User
from category.models import Category
from uauth.views import User_auth,CSRF
from search.views import Search,Search_user

# Create your tests here.

class SearchTest(TestCase):

    def setUp(self):
        call_command("loaddata", "test_data.json",verbosity=0)
        self.factory = APIRequestFactory()
    
    # def test_get_search_category(self):

    #     search_category_url = "/api/search/"      
    #     search_category_request = self.factory.get(search_category_url, {"category":"dinner"})
    #     # force_authenticate(search_category_request, user=user)
    #     search_category_view = Search.as_view()
    #     search_category_response = search_category_view(search_category_request)
    #     self.assertEqual(search_category_response.status_code, 200)

    def test_get_search_user(self):

        """Test get user recipe after logging in"""

        user = User.objects.get(id=1)

        # get status code
        search_user_url = "/api/search_user/"      
        search_user_request = self.factory.get(search_user_url)
        force_authenticate(search_user_request, user=user)
        search_user_view = Search_user.as_view()
        search_user_response = search_user_view(search_user_request)
        self.assertEqual(search_user_response.status_code, 200)

        # # get msg
        # self.assertEqual(search_user_response.data['code'], 100)
        # self.assertEqual(search_user_response.data['msg'], "success")

        # # get data

        # expected_data = 

        
        

    
