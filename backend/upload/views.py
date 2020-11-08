
from django.http import HttpResponse
from django.core.files.storage import FileSystemStorage
from uauth.auth import UserAuth
from user.models import User
from recipe_blog.models import Recipe
from comments.models import Comment
from upload.models import Upload_profile, Upload_recipe, Upload_comment_meta
from upload.serializers import UploadSerializer, UploadSerializer_recipe, UploadSerializer_commentmeta

from django.core.cache import cache

from rest_framework import status, exceptions
from rest_framework.views import APIView
from rest_framework.response import Response

# Create your views here.


class upload_profile_view(APIView):

    serializer_class = UploadSerializer
    queryset = Upload_profile.objects.all()
    authentication_classes = (UserAuth,)

    def post(self, request, *args, **kwargs):
        file_uploaded = request.FILES['document']
        user_id = request.data.get('user_id')
        user = User.objects.get(id=user_id)

        new_entry = Upload_profile.objects.create(
            user=user, profile_image=file_uploaded)
        return Response("success")


class upload_recipe_view(APIView):

    serializer_class = UploadSerializer_recipe
    queryset = Upload_recipe.objects.all()
    authentication_classes = (UserAuth,)

    def post(self, request, *args, **kwargs):
        file_uploaded = request.FILES['document']
        recipe_id = request.data.get('recipe_id')
        recipe = Recipe.objects.get(id=recipe_id)
        step_id = request.data.get('step_id')

        new_entry = Upload_recipe.objects.create(
            recipe=recipe, step_id=step_id, recipe_image=file_uploaded)
        return Response("success")


class upload_comment_view(APIView):

    serializer_class = UploadSerializer_commentmeta
    queryset = Upload_comment_meta.objects.all()
    authentication_classes = (UserAuth,)

    def post(self, request, *args, **kwargs):
        file_uploaded = request.FILES['document']
        comment_id = request.data.get('comment_id')
        comment = Comment.objects.get(id=comment_id)

        new_entry = Upload_comment_meta.objects.create(
            comment=comment, comment_image=file_uploaded)
        return Response("success")

