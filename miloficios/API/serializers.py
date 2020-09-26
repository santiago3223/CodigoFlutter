from rest_framework import serializers
from .models import *


class SubCategoriaSerializer(serializers.ModelSerializer):

    class Meta:
        model = Subcategoria
        fields = ['categoria', 'nombre', 'urlBanner', 'urlLogo']


class CategoriaSerializer(serializers.ModelSerializer):
    subcategorias = SubCategoriaSerializer(many=True)

    class Meta:
        model = Categoria
        fields = ['nombre', 'urlBanner', 'urlLogo', 'subcategorias']


class BannerPublicitarioSerializer(serializers.ModelSerializer):

    class Meta:
        model = BannerPublicitario
        fields = ['urlBanner']


class ClienteSerializer(serializers.ModelSerializer):

    class Meta:
        model = Cliente
        fields = ['id', 'username', 'password', 'email', 'first_name', 'last_name', 'dni']
        extra_kwargs = {
            'password':{'write_only': True}
        }
    
    def create(self, validated_data):
        user = Cliente.objects.create(
            username = validated_data["username"],
            email = validated_data["email"],
            first_name = validated_data["first_name"],
            last_name = validated_data["last_name"],
            dni = validated_data["dni"],
        )

        user.set_password(validated_data["password"])
        user.save()
        return user


