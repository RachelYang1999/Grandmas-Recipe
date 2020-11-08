from calendars import views
from django.urls import path, re_path

urlpatterns = [
    path('calendar/', views.Calendar_view.as_view()),
]