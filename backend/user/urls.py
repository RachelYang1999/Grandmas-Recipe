from user import views
from django.urls import path, re_path

urlpatterns = [
    path('follow/', views.Follow_view.as_view()),
    # path('user/favourite/', views.User_auth.as_view()),
    # path('user/mine/', views.User_auth.as_view()),
    # path('user/draft/', views.User_auth.as_view()),
]