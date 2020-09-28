from django.shortcuts import render
from django.http import HttpResponse
from .models import *
from rest_framework import generics
from .serializers import *
from rest_framework.permissions import AllowAny
from rest_framework.decorators import permission_classes

# Create your views here.
def index(request):
    return HttpResponse("<h1>Hola CodiGo</h1>")

def retornarCategorias(request):
    categorias = Categoria.objects.all()
    jsonCategorias = '['
    for categoria in categorias:
        jsonCategorias += '{"nombre":"'+ str(categoria ) +'"},'
    jsonCategorias += ']'
    return HttpResponse(jsonCategorias)

@permission_classes((AllowAny, ))
class CategoriasList(generics.ListCreateAPIView):
    queryset = Categoria.objects.all()
    serializer_class = CategoriaSerializer

class CategoriasGet(generics.RetrieveUpdateDestroyAPIView):
    queryset = Categoria.objects.all()
    serializer_class = CategoriaSerializer

class SubCategoriaList(generics.ListCreateAPIView):
    queryset = Subcategoria.objects.all()
    serializer_class = SubCategoriaSerializer

class SubCategoriaGet(generics.RetrieveUpdateDestroyAPIView):
    queryset = Subcategoria.objects.all()
    serializer_class = SubCategoriaSerializer

@permission_classes((AllowAny, ))
class BannersPublicitariosGet(generics.ListAPIView):
    queryset = BannerPublicitario.objects.all()
    serializer_class = BannerPublicitarioSerializer

class ClienteCreate(generics.CreateAPIView):
    queryset = Cliente.objects.all()
    serializer_class = ClienteSerializer