from django.contrib import admin
from django.urls import path
from articles.views import archive

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', archive, name='archive'),
]
