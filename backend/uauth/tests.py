from django.test import TestCase
from rest_framework.test import APIRequestFactory,force_authenticate
from unittest.mock import patch
from django.core.management import call_command

from user.models import User
from uauth.views import User_auth,User_pass,User_se_pass,CSRF



class MockAPITest(TestCase):

    def setUp(self):
        call_command("loaddata", "test_data.json",verbosity=0)
        
        self.factory = APIRequestFactory()

        url = "/api/auth/"      
        request=self.factory.post(url,{"username":"root","password":"root"})
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

    def test_uauth_put(self):
        view = User_auth.as_view()

        url = "/api/auth/"      
        request=self.factory.post(url,{"username":"root111111","password":"root11111"})

        response = view(request)
        exp=None

        rst= response.data["data"]

        self.assertEqual(rst, exp)


    def test_uauth_pass_post(self):
        view = User_pass.as_view()
        user = User.objects.get(id=1)

        url = "/api/password/"      
        request = self.factory.post(url, {"old-password":"root111111","new-password":"root11111"})

        force_authenticate(request, user=user)

        response = view(request)
        exp=None

        rst= response.data["data"]

        self.assertEqual(rst, exp)
    
    def test_uauth_email_post(self):
        view = User_se_pass.as_view()
        user = User.objects.get(id=1)

        url = "/api/e_password/"      
        request = self.factory.post(url, {"email":"root1@11111"})

        force_authenticate(request, user=user)

        response = view(request)
        exp=None

        rst= response.data["data"]

        self.assertEqual(rst, exp)

    def test_uauth_code_post(self):
        view = User_se_pass.as_view()
        user = User.objects.get(id=1)

        url = "/api/f_password/"      
        request = self.factory.post(url, {"code":"Advaavqe","new-password":"sacvasvas"})

        force_authenticate(request, user=user)

        response = view(request)
        exp=None

        rst= response.data["data"]

        self.assertEqual(rst, exp)

    def test_CSRF(self):
        view = CSRF.as_view()
        user = User.objects.get(id=1)

        url = "/api/csrftoken/"      
        request = self.factory.get(url)

        force_authenticate(request, user=user)

        response = view(request)
        exp="success"

        rst= response.data["msg"]

        self.assertEqual(rst, exp)