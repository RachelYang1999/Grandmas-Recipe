
from django.http import HttpResponse
from django.core.files.storage import FileSystemStorage
from uauth.auth import UserAuth
from user.models import User
from recipe.models import Recipe
from step.models import Step
from comments.models import Comment
from upload.models import Upload_comment_meta
# from upload.serializers import UploadSerializer, UploadSerializer_recipe, UploadSerializer_commentmeta

from django.core.cache import cache

from rest_framework import status, exceptions
from rest_framework.views import APIView
from rest_framework.response import Response

import app_3609.util as util

import json


class upload_profile_view(APIView):

    authentication_classes = (UserAuth,)

    def post(self, request, *args, **kwargs):
        file_uploaded = request.FILES['document']
        user = request.user

        user.profile_image=file_uploaded
        user.save()

        data={
            "src": User.objects.filter(id=user.id).values()[0]["profile_image"]
        }

        rst=util.get_response(100,"success",data)
        
        return Response(rst)

class upload_intro_view(APIView):

    authentication_classes = (UserAuth,)

    def post(self, request, *args, **kwargs):
        file_uploaded = request.FILES['document']
        recipe_id = request.data.get('recipe_id')
        recipe = Recipe.objects.get(id=recipe_id)
        recipe.intro_image=file_uploaded
        recipe.save()

        rst=util.get_response(100,"success",None)
        
        return Response(rst)


class upload_recipe_view(APIView):

    authentication_classes = (UserAuth,)

    def post(self, request, *args, **kwargs):

        file_uploaded = request.FILES['document']
        recipe_id = request.data.get('recipe_id')
        recipe = Recipe.objects.get(id=recipe_id)
        step_id = request.data.get('step_id')

        step=Step.objects.get(id=step_id)
        step.step_image=file_uploaded
        step.save()
    
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

