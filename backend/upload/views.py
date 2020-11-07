
from django.http import HttpResponse
from django.core.files.storage import FileSystemStorage
from uauth.auth import UserAuth
from user.models import User
from upload.models import Upload_profile, Upload_recipe
from upload.serializers import UploadSerializer,UploadSerializer_recipe

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
        file_uploaded =  request.FILES['document']
        user_id = request.data.get('user_id')
        # file_storage_system = FileSystemStorage()
        # name = file_storage_system.save(file_uploaded.name,file_uploaded)
        user=User.objects.get(id=user_id)


        new_entry = Upload_profile.objects.create(user=user,profile_image = file_uploaded)
        return Response("success")