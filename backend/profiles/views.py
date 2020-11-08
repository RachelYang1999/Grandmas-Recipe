from uauth.auth import UserAuth
from django.shortcuts import render
from django.http import HttpResponse
from profiles.serializers import ProfileSerializer
from user.models import User

from rest_framework import status, exceptions
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import viewsets

# Create your views here.

class Profiles(APIView):
    authentication_classes = (UserAuth,)
    serializer_class = ProfileSerializer
    # user = User()
    
    def get(self, request):
        user_id=request.data.get("id")
        user=User.objects.get(id=user_id)

        get_username = user.username
        get_email = user.email
        get_introduction = user.introduction
        get_gender = user.gender
        get_date_of_birth = user.date_of_birth
        get_total_follower = user.total_follower
        get_total_following = user.total_following
        get_profile = {
            "username": get_username,
            "email": get_email,
            "introduction": get_introduction,
            "gender": get_gender,
            "date_of_birth": get_date_of_birth,
            "total_follower": get_total_follower,
            "total_following": get_total_following            
        }
        print(get_profile)
        return Response("Profile Get Success")
        
    
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
        
        return Response("Success")

            


    
    # def post(self, request):
        
    #     # profile_serializer = ProfileSerializer(data = request.data)
    #     user_id=request.data.get("id")
    #     email=request.data.get("email")
    #     print(email)
    #     # user_id=request.data.get("id")
    #     # user_id=request.data.get("id")
    #     # user_id=request.data.get("id")
    #     user=User.objects.get(id=user_id)
    #     # user.update(email=)
    #     user.save()

    #     return Response("success")
        
    #     # if profile_serializer.is_valid():
    #         # profile_serializer.save()
    #         # return Response(profile_serializer.data)

    #     # return Response(data={'msg': 'error'}, status=status.HTTP_400_BAD_REQUEST)

    
# class ProfileViewSet(viewsets.ModelViewSet):
#     queryset = User.objects.all()
#     serializer_class = ProfileSerializer




# def profiles(request):
#     return render(request,'frontend.views.self_profile.tpl')

# def profiles(request):
#     return HttpResponse('You are looking at a profile!')
#     # return render(request,'self_profile.tpl')

# def add_profile(request):
#     user = User()
#     user.username = "NamePurple"
#     user.password = "Password123"
#     user.email = "zihe7096@uni.sydney.edu.au"
#     user.introduction = "This is my introduction"
#     user.gender = "Female"
#     user.date_of_birth = "1999-4-29"
#     user.total_follower = 0
#     user.total_following = 0
#     user.save()
    
#     return HttpResponse("Add Success")

# def get_profile(request):
#     profiles = User.objects.all()
#     for p in profiles:
#         print(p.username)
#     context = {
#         "p": "Sophie",
#         "profiles": profiles
#     }
#     # return HttpResponse("Profile List")
#     return render(request, 'profile_list.tpl', context=context)

# def update_profile(request):
#     profile = User.objects.get(id=8)
#     profile.email = 'zihe7096@uni.sydney.edu.au'
#     profile.save()
#     return HttpResponse("Profile Update Success")

# def delete_profile(request):
#     profile = User.objects.get(id=8)
#     profile.delete()
#     return HttpResponse("Profile Delete Success")

