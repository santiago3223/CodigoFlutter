// To parse this JSON data, do
//
//     final categoria = categoriaFromJson(jsonString);

import 'dart:convert';

Categoria categoriaFromJson(String str) => Categoria.fromJson(json.decode(str));

String categoriaToJson(Categoria data) => json.encode(data.toJson());

class Categoria {
  Categoria({
    this.nombre,
    this.urlBanner,
    this.urlLogo,
  });

  String nombre;
  String urlBanner;
  String urlLogo;

  factory Categoria.fromJson(Map<String, dynamic> json) => Categoria(
        nombre: json["nombre"],
        urlBanner: json["urlBanner"],
        urlLogo: json["urlLogo"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "urlBanner": urlBanner,
        "urlLogo": urlLogo,
      };
}
