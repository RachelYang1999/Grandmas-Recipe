from django.test import TestCase
from rest_framework.test import APIRequestFactory,force_authenticate
from unittest.mock import patch
from django.core.management import call_command

from user.models import User
from uauth.views import User_auth



class MockAPITest(TestCase):

    def setUp(self):
        call_command("loaddata", "test_data.json",verbosity=0)
        
        self.factory = APIRequestFactory()

        url = "/api/auth/"      
        request=self.factory.post(url,{"username":"root","password":"root"})
        view=User_auth.as_view()
        response = view(request)
        self.token=response.data["data"]["token"]
        

    def test_uauth_get(self):
        view = User_auth.as_view()
        user = User.objects.get(id=1)

        url = "/api/auth/"      
        request = self.factory.get(url)

        force_authenticate(request, user=user)

        response = view(request)
        exp={'username': 'root', 'avatar': 'avatar/default.png'}

        rst= response.data["data"]

        self.assertEqual(rst, exp)

    def test_uauth_delete(self):
        view = User_auth.as_view()
        user = User.objects.get(id=1)

        url = "/api/auth/"      
        request = self.factory.delete(url,HTTP_TOKEN=self.token)

        force_authenticate(request, user=user)

        response = view(request)
        exp=None

        rst= response.data["data"]

        self.assertEqual(rst, exp)

