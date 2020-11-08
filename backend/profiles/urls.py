from django.conf.urls import url
from profiles import views
from django.urls import path, re_path

# from rest_framework.routers import DefaultRouter
# from profiles.views import ProfileViewSet

urlpatterns = [
    path('profiles/', views.Profiles.as_view()),
    # path('profiles/',views.profiles),
    # url(r'^profiles/',views.profiles),
    # url(r'^addprofile/',views.add_profile),
    # url(r'^getprofile/',views.get_profile),
    # url(r'^updateprofile/',views.update_profile),
    # url(r'^deleteprofile/',views.delete_profile),
]

# router = DefaultRouter()
# router.register(r'profiles', ProfileViewSet)

