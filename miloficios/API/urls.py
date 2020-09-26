from django.contrib import admin
from django.urls import path
from API import views
from rest_framework_jwt.views import obtain_jwt_token, refresh_jwt_token, verify_jwt_token

urlpatterns = [
    path('', views.index),
    path('token-auth/', obtain_jwt_token),
    path('token-refresh/', refresh_jwt_token),
    path('token-verify/', verify_jwt_token),
    path('listarCategorias', views.retornarCategorias),
    path('categoriasList/', views.CategoriasList.as_view()),
    path('categoriasList/<int:pk>/', views.CategoriasGet.as_view()),
    path('subcategoriasList/', views.SubCategoriaList.as_view()),
    path('subcategoriasList/<int:pk>/', views.SubCategoriaGet.as_view()),
    path('bannerspublicitarios/', views.BannersPublicitariosGet.as_view()),

]
