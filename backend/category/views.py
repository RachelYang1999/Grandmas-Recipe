from uauth.auth import UserAuth
from category.models import Category
from category.serializers import CategorySerializer

from django.core.cache import cache

from rest_framework import status, exceptions
from rest_framework.views import APIView
from rest_framework.response import Response

import app_3609.util as util


class Category_view(APIView):

    def get(self, request, *args, **kwargs):
        rst=util.get_response(100,"success",Category.objects.all().values())
        # print()
        return Response(rst)
