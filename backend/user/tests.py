from django.test import TestCase
from rest_framework.test import APIRequestFactory,force_authenticate
from unittest.mock import patch
from django.core.management import call_command
from django.test import Client

from recipe.models import Recipe
from user.models import User, User_follow
from uauth.views import User_auth
from profiles.views import Profiles
from user.views import Follow_view
from datetime import datetime, date

# Create your tests here.

class UserTest(TestCase):

    def setUp(self):
        call_command("loaddata", "test_data.json",verbosity=0)
        self.factory = APIRequestFactory()
    
    def test_get_follow(self):
        user = User.objects.get(id=1)

        # status code
        follow_url = "/api/follow/"
        follow_request = self.factory.get(follow_url,{"id":1})
        force_authenticate(follow_request, user=user)
        follow_view = Follow_view.as_view()
        follow_response = follow_view(follow_request)
        self.assertEqual(follow_response.status_code, 200)

        # get msg
        self.assertEqual(follow_response.data['code'], 100)
        self.assertEqual(follow_response.data['msg'], "success")

    def test_post_follow(self):
        view = Follow_view.as_view()
        user = User.objects.get(id=1)

        url = "/api/follow/"      
        request = self.factory.post(url, {"to_user":"2"})

        force_authenticate(request, user=user)

        response = view(request)
        exp=None

        rst= response.data["data"]

        request = self.factory.post(url, {"to_user":"7"})

        force_authenticate(request, user=user)

        response = view(request)
        exp=None

        rst= response.data["data"]

        self.assertEqual(rst, exp)

    def test_del_follow(self):
        view = Follow_view.as_view()
        user = User.objects.get(id=1)

        url = "/api/follow/"      
        request = self.factory.delete(url, {"to_user":"2"})

        force_authenticate(request, user=user)

        response = view(request)
        exp=None

        rst= response.data["data"]

        self.assertEqual(rst, exp)


