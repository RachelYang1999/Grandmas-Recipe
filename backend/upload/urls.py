from django.conf.urls import url
from upload import views
from django.urls import path, re_path
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('upload/profile_image/', views.upload_profile_view.as_view()),
    path('upload/intro_image/', views.upload_intro_view.as_view()),
    path('upload/recipe_image/', views.upload_recipe_view.as_view()),
    path('upload/comment_image/', views.upload_comment_view.as_view()),
]

