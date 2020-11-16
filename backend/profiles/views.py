from uauth.auth import UserAuth
from django.shortcuts import render
from django.http import HttpResponse
from profiles.serializers import ProfileSerializer
from user.models import User

from rest_framework import status, exceptions
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import viewsets

import app_3609.util as util

class Profiles(APIView):
    authentication_classes = (UserAuth,)
    
    def get(self, request):
        user_id=request.query_params.get("user_id")
        if user_id==None:
            user=request.user
        else: 
            user=User.objects.get(id=user_id)
        get_profile = {
            "username": user.username,
            "email": user.email,
            "introduction": user.introduction,
            "gender": user.gender,
            "dob": user.date_of_birth,
            "dor": user.register_date
        }
        rst=util.get_response(200,"success",get_profile)
        return Response(rst)
        
    
    def post(self, request):
        user_id=request.data.get("id")
        user=User.objects.get(id=user_id)

        post_email=request.data.get("email")
        post_introduction=request.data.get("introduction")
        post_gender = request.data.get("gender")
        
        if post_email != None:
            user.email = post_email
            user.save()
        if post_introduction != None:
            user.introduction = post_introduction
            user.save()
        if post_gender != None:
            user.gender = post_gender
            user.save()

        rst=util.get_response(200,"success",[])
        
        return Response(rst)
