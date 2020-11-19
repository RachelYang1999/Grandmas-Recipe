from django.conf.urls import url
from recipe import views
from django.urls import path, re_path

urlpatterns = [
    path('recipe/', views.RecipeView.as_view()),
    path('edit_recipe/', views.RecipeEditView.as_view()),
    path('index_recipe/', views.RecipeIndexView.as_view()),
    path('fav_recipe/', views.RecipeFavView.as_view()),
]
