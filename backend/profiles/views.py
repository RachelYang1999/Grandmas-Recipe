from django.shortcuts import render
from django.http import HttpReponse

# Create your views here.

def profiles(request):
    return HttpResponse("You're looking at a profile!")