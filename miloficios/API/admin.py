from django.contrib import admin
from .models import *
# Register your models here.

admin.site.register(Categoria)
admin.site.register(Subcategoria)
admin.site.register(BannerPublicitario)
admin.site.register(Cliente)
admin.site.register(Solicitud)
admin.site.register(RespuestaSolicitud)