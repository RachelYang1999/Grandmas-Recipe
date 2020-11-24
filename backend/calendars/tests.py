from django.test import TestCase
from rest_framework.test import APIRequestFactory,force_authenticate
from unittest.mock import patch
from django.core.management import call_command

from user.models import User
from calendars.views import Calendar_view



class MockAPITest(TestCase):

    def setUp(self):
        call_command("loaddata", "test_data.json",verbosity=0)
        
        self.factory = APIRequestFactory()
        

    def test_cal_get(self):
        view = Calendar_view.as_view()
        user = User.objects.get(id=1)

        url = "/api/calendar/?start=2020-11-15&end=2020-11-23"      
        request = self.factory.get(url)

        force_authenticate(request, user=user)

        response = view(request)
        exp="success"

        rst= response.data["msg"]

        self.assertEqual(rst, exp)

    def test_cal_post(self):
        view = Calendar_view.as_view()
        user = User.objects.get(id=1)

        url = "/api/calendar/"      
        request = self.factory.post(url, {"recipe_id":1,"date":"2020-11-20","meal_type":"lunch"})

        force_authenticate(request, user=user)

        response = view(request)
        exp="success"

        rst= response.data["msg"]

        self.assertEqual(rst, exp)
    
   