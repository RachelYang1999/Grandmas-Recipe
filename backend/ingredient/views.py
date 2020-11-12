from django.shortcuts import render

from uauth.auth import UserAuth
from ingredient.models import Ingredient

from django.core.cache import cache

from rest_framework import status, exceptions
from rest_framework.views import APIView
from rest_framework.response import Response

class Ingredient_View(APIView):
    authentication_classes = (UserAuth,)
    ingredient_queryset = Ingredient.objects.all()

    def get(self, request):
        if ingredient_queryset != None:
            return Response(ingredient_queryset.values())
        else:
            return Response("No ingredients found")