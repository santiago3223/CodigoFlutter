
from django.contrib import admin
from django.urls import path, include


urlpatterns = [
    path('API/', include('API.urls')),
    path('admin/', admin.site.urls),
    
]
