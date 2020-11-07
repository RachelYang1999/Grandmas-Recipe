from django.conf.urls import url
from profiles import views
from django.urls import path, re_path

urlpatterns = [
    # path('profiles/',views.profiles),
    url(r'^profiles/',views.profiles),
    url(r'^addprofile/',views.add_profile),
    url(r'^getprofile/',views.get_profile),
    url(r'^updateprofile/',views.update_profile),
    url(r'^deleteprofile/',views.delete_profile),
]

