from django.conf.urls import url
from search import views
from django.urls import path, re_path

urlpatterns = [
    path('search/', views.Search.as_view()),
    path('search_user/', views.Search_user.as_view()),
]
