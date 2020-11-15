from django.conf.urls import url
from recipe_blog import views
from django.urls import path, re_path

urlpatterns = [
    path('recipe_blog/', views.RecipeView.as_view()),
]
