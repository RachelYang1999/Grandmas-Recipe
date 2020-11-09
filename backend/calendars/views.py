from uauth.auth import UserAuth
from calendars.models import Calendar
from user.models import User
from recipe_blog.models import Recipe

from django.core.cache import cache

import app_3609.util as util

from rest_framework import status, exceptions
from rest_framework.views import APIView
from rest_framework.response import Response



class Calendar_view(APIView):
    queryset = Calendar.objects.all()
    authentication_classes = (UserAuth,)

    def get(self, request, *args, **kwargs):
        start = request.query_params.get('start')
        end = request.query_params.get('end')
        start,end=util.compare_time(start,end)
        user = request.user

        return Response(Calendar.objects.filter(user=user,date__gte=start,date__lte=end).values())

    def post(self, request, *args, **kwargs):
        user_id = request.data.get('user_id')
        recipe_id = request.data.get('recipe_id')
        date = request.data.get('date')
        meal_type = request.data.get('meal_type')

        calendar = Calendar.objects.create(date=date, meal_type=meal_type, user=User.objects.get(
            id=user_id), recipe=Recipe.objects.get(id=recipe_id))
        calendar.save()

        data = {
            'msg': 'success',
        }

        return Response(data, status=201)
