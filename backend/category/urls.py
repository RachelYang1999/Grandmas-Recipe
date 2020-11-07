from category import views
from django.urls import path, re_path

urlpatterns = [
    path('category/', views.Category_view.as_view()),
]