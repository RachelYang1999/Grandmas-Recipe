from uauth.auth import UserAuth
from category.models import Category
from category.serializers import CategorySerializer

from django.core.cache import cache

from rest_framework import status, exceptions
from rest_framework.views import APIView
from rest_framework.response import Response


class Category_view(APIView):
    serializer_class = CategorySerializer
    queryset = Category.objects.all()
    authentication_classes = (UserAuth,)

    def get(self, request, *args, **kwargs):
        return Response(Category.objects.all().values())
