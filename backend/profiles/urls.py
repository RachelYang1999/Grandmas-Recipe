from django.conf.urls import url
from profiles import views
from django.urls import path, re_path

urlpatterns = [
    path('user/profile/', views.Profiles.as_view()),
]

