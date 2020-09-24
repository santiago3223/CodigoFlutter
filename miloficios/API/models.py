from django.db import models

# Create your models here.
class Categoria(models.Model):
    nombre = models.CharField(max_length=200)
    urlBanner = models.TextField(null=True, blank=True)
    urlLogo = models.TextField(null=True, blank=True)

    def __str__(self):
        return self.nombre
    
