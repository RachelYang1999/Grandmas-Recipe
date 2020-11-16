
from django.http import HttpResponse
from django.core.files.storage import FileSystemStorage
from uauth.auth import UserAuth
from user.models import User
from recipe.models import Recipe
from comments.models import Comment
from upload.models import Upload_profile, Upload_recipe, Upload_comment_meta
from upload.serializers import UploadSerializer, UploadSerializer_recipe, UploadSerializer_commentmeta

from django.core.cache import cache

from rest_framework import status, exceptions
from rest_framework.views import APIView
from rest_framework.response import Response

import app_3609.util as util


class upload_profile_view(APIView):

    authentication_classes = (UserAuth,)

    def post(self, request, *args, **kwargs):
        file_uploaded = request.FILES['document']
        user = request.user

        new_entry = Upload_profile.objects.create(
            user=user, profile_image=file_uploaded)

        rst=util.get_response(100,"success",None)
        
        return Response(rst)


class upload_recipe_view(APIView):

    authentication_classes = (UserAuth,)

    def post(self, request, *args, **kwargs):
        file_uploaded = request.FILES['document']
        recipe_id = request.data.get('recipe_id')
        recipe = Recipe.objects.get(id=1)
        step_id = request.data.get('step_id')

        new_entry = Upload_recipe.objects.create(
            recipe=recipe, step_id=step_id, recipe_image=file_uploaded)
        
        rst=util.get_response(100,"success",None)
        
        return Response(rst)


class upload_comment_view(APIView):

    authentication_classes = (UserAuth,)

    def post(self, request, *args, **kwargs):
        file_uploaded = request.FILES['document']
        comment_id = request.data.get('comment_id')
        comment = Comment.objects.get(id=comment_id)

        new_entry = Upload_comment_meta.objects.create(
            comment=comment, comment_image=file_uploaded)
        
        rst=util.get_response(100,"success",None)
        
        return Response(rst)

