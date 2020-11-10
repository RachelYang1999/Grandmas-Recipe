from uauth.auth import UserAuth
from category.models import Category
from category.serializers import CategorySerializer

from django.core.cache import cache

from rest_framework import status, exceptions
from rest_framework.views import APIView
from rest_framework.response import Response

class Step_View(APIView):
    authentication_classes = (UserAuth,)
    step_queryset = Category.objects.all()

    def get(self, request):
        if step_queryset != None:
            return Response(step_queryset.values())
        else:
            return Response("No steps found")