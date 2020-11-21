from django.conf.urls import url
from comments import views
from django.urls import path, re_path
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('comments/', views.Comment_view.as_view()),
]