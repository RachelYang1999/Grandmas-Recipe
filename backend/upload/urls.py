from django.conf.urls import url
from upload import views
from django.urls import path, re_path

urlpatterns = [
    path('upload/',views.upload),
]