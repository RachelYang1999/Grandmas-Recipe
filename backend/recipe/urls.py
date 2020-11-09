from django.conf.urls import url
from recipe import views
from django.urls import path, re_path

urlpatterns = [
    path('recipe/', views.RecipeView.as_view()),
]
