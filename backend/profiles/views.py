from django.shortcuts import render
from django.http import HttpResponse
from user.models import User

# Create your views here.

# def profiles(request):
#     return render(request,'frontend.views.self_profile.tpl')

def profiles(request):
    return HttpResponse('You are looking at a profile!')
    # return render(request,'self_profile.tpl')

def add_profile(request):
    user = User()
    user.username = "NamePurple"
    user.password = "Password123"
    user.email = "zihe7096@uni.sydney.edu.au"
    user.introduction = "This is my introduction"
    user.gender = "Female"
    user.date_of_birth = "1999-4-29"
    user.total_follower = 0
    user.total_following = 0
    user.save()
    
    return HttpResponse("Add Success")

def get_profile(request):
    profiles = User.objects.all()
    for p in profiles:
        print(p.username)
    context = {
        "p": "Sophie",
        "profiles": profiles
    }
    # return HttpResponse("Profile List")
    return render(request, 'profile_list.tpl', context=context)

def update_profile(request):
    profile = User.objects.get(id=8)
    profile.email = 'zihe7096@uni.sydney.edu.au'
    profile.save()
    return HttpResponse("Profile Update Success")

def delete_profile(request):
    profile = User.objects.get(id=8)
    profile.delete()
    return HttpResponse("Profile Delete Success")

