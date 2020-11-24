from django.test import TestCase
from rest_framework.test import APIRequestFactory,force_authenticate
from unittest.mock import patch
from django.core.management import call_command
from django.test import Client

from recipe.models import Recipe
from user.models import User
from uauth.views import User_auth
from profiles.views import Profiles
from datetime import datetime, date

# Create your tests here.

class ProfileTest(TestCase):

    def setUp(self):
        call_command("loaddata", "test_data.json",verbosity=0)
        self.factory = APIRequestFactory()

        User.objects.create(\
            username = "testuser",\
                email = "testuser@gamil.com",\
                    gender = "male"
        )

    def test_user_model(self):

        """Test the model of User"""
        first_user = User.objects.get(username="testuser")
        self.assertEqual(first_user.username, "testuser")
        self.assertEqual(first_user.email, "testuser@gamil.com")
        self.assertEqual(first_user.gender, "male")

    def test_get_profile_status_code_without_login(self):
        user = User.objects.get(username="testuser")
        user_id = user.id
        url = "/api/profile/"   
        request = self.factory.get(url, {"id":user_id})
        profile_view = Profiles.as_view()
        response = profile_view(request)
        self.assertEqual(response.status_code, 403)

    def test_get_profile(self):

        """Test get profile after logging in"""
        login_url = "/api/auth/"      
        login_request = self.factory.post(login_url,{"username":"root","password":"root"})
        login_view = User_auth.as_view()
        login_response = login_view(login_request)
        self.token = login_response.data["data"]["token"]

        user = User.objects.get(id=1)

        # get status code
        profile_url = "/api/profile/"      
        profile_request = self.factory.get(profile_url, {"id":1})
        force_authenticate(profile_request, user=user)
        profile_view = Profiles.as_view()
        profile_response = profile_view(profile_request)
        self.assertEqual(profile_response.status_code, 200)

        # get msg
        self.assertEqual(profile_response.data['code'], 100)
        self.assertEqual(profile_response.data['msg'], "success")

        # get data
        expected_data = {

            "username": "root",
            "email": "root",
            "introduction": "",
            "gender": "",
            "dob": date(int(2020), int(11), int(19)),
            "dor": datetime(int(2020), int(11), int(19), int(8), int(57), int(50), int(49000))
        }

        self.assertEqual(profile_response.data["data"], expected_data)

    
    def test_post_profile_with_info(self):

        login_url = "/api/auth/"      
        login_request = self.factory.post(login_url,{"username":"root","password":"root"})
        login_view = User_auth.as_view()
        login_response = login_view(login_request)
        self.token = login_response.data["data"]["token"]

        user = User.objects.get(id=1)

        profile_url = "/api/profile/"      
        profile_request = self.factory.post(profile_url, {"email": user.email, "gender": user.gender, "date_of_birth": user.date_of_birth})
        force_authenticate(profile_request, user=user)
        profile_view = Profiles.as_view()
        profile_response = profile_view(profile_request)
        self.assertEqual(profile_response.status_code, 200)

    def test_post_profile_without_info(self):

        login_url = "/api/auth/"      
        login_request = self.factory.post(login_url,{"username":"root","password":"root"})
        login_view = User_auth.as_view()
        login_response = login_view(login_request)
        self.token = login_response.data["data"]["token"]

        user = User.objects.get(id=1)

        profile_url = "/api/profile/"      
        profile_request = self.factory.post(profile_url)
        force_authenticate(profile_request, user=user)
        profile_view = Profiles.as_view()
        profile_response = profile_view(profile_request)
        self.assertEqual(profile_response.status_code, 200)





   




