from uauth import views
from django.urls import path, re_path

urlpatterns = [
    path('auth/', views.User_auth.as_view()),
]