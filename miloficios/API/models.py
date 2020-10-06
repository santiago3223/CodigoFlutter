from django.db import models
from django.contrib.auth.models import AbstractUser

# Create your models here.
class Categoria(models.Model):
    nombre = models.CharField(max_length=200)
    urlBanner = models.TextField(null=True, blank=True)
    urlLogo = models.TextField(null=True, blank=True)

    def __str__(self):
        return self.nombre
    
class Subcategoria(models.Model):
    categoria = models.ForeignKey(Categoria, on_delete=models.CASCADE, related_name="subcategorias")
    nombre = models.CharField(max_length=200)
    urlBanner = models.TextField(null=True, blank=True)
    urlLogo = models.TextField(null=True, blank=True)

    def __str__(self):
        return self.nombre
    
class BannerPublicitario(models.Model):
    urlBanner = models.TextField(null=True, blank=True)


class Cliente(AbstractUser):
    dni = models.CharField(max_length=10)

class Solicitud(models.Model):
    subCategoria = models.ForeignKey(Subcategoria, on_delete=models.CASCADE, related_name="solicitudes")
    descripcion = models.TextField(null=True, blank=True)
    precio = models.FloatField(null=True, blank=True)
    cliente = models.ForeignKey(Cliente, on_delete=models.CASCADE, blank=True, null=True)