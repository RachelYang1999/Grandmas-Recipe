from uauth import views
from django.urls import path, re_path

urlpatterns = [
    path('auth/', views.User_auth.as_view()),
    path('password/', views.User_pass.as_view()),
    path('f_password/', views.User_for_pass.as_view()),
    path('e_password/', views.User_se_pass.as_view()),
    path('csrftoken/', views.CSRF.as_view()),
]