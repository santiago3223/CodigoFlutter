from django.contrib import admin
from django.urls import path
from API import views

urlpatterns = [
    path('', views.index),
    path('listarCategorias', views.retornarCategorias),
    path('categoriasList/', views.CategoriasList.as_view()),
    path('categoriasList/<int:pk>/', views.CategoriasGet.as_view()),
    path('subcategoriasList/', views.SubCategoriaList.as_view()),
    path('subcategoriasList/<int:pk>/', views.SubCategoriaGet.as_view()),
    path('bannerspublicitarios/', views.BannersPublicitariosGet.as_view()),

]
