from rest_framework import serializers
from .models import *

class CategoriaSerializer(serializers.ModelSerializer):

    class Meta:
        model = Categoria
        fields = ['nombre', 'urlBanner', 'urlLogo']

class SubCategoriaSerializer(serializers.ModelSerializer):

    class Meta:
        model = Subcategoria
        fields = ['categoria', 'nombre', 'urlBanner', 'urlLogo']
