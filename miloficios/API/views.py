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

@permission_classes((AllowAny, ))
class ClienteCreate(generics.CreateAPIView):
    queryset = Cliente.objects.all()
    serializer_class = ClienteSerializer

@permission_classes((AllowAny, ))
class ClienteRetrieve(generics.RetrieveAPIView):
    queryset = Cliente.objects.all()
    serializer_class = ClienteSerializer

    def get_object(self):
        #return Cliente.objects.filter(id=self.request.user.id).first()
        return self.request.user


@permission_classes((AllowAny, ))
class SolicitudCreate(generics.ListCreateAPIView):
    queryset = Solicitud.objects.all()
    serializer_class = SolicitudSerializer

    def perform_create(self, serializer):
        serializer.save(cliente=Cliente.objects.get(pk=self.request.user.id))

    def get_queryset(self):
        return Solicitud.objects.filter(cliente__pk=self.request.user.pk).all()


@permission_classes((AllowAny, ))
class RespuestaSolicitudList(generics.ListAPIView):
    queryset = RespuestaSolicitud.objects.all()
    serializer_class = RespuestaSolicitudSerializer



