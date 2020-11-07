from django.conf.urls import url
from upload import views
from django.urls import path, re_path
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('upload/profile_image/',views.upload_profile_view.as_view(),name = 'upload_profile_image'),
    path('upload/recipe_image/',views.upload_recipe_view.as_view(),name = 'upload_recipe_image'),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)