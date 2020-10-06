// To parse this JSON data, do
//
//     final categoria = categoriaFromJson(jsonString);

import 'dart:convert';

Categoria categoriaFromJson(String str) => Categoria.fromJson(json.decode(str));

String categoriaToJson(Categoria data) => json.encode(data.toJson());

class Categoria {
  Categoria({
    this.id,
    this.nombre,
    this.urlBanner,
    this.urlLogo,
    this.subcategorias,
    this.categoria,
  });

  int id;
  String nombre;
  String urlBanner;
  String urlLogo;
  List<Categoria> subcategorias;
  int categoria;

  factory Categoria.fromJson(Map<String, dynamic> json) => Categoria(
        id: json["id"],
        nombre: json["nombre"],
        urlBanner: json["urlBanner"],
        urlLogo: json["urlLogo"],
        subcategorias: json["subcategorias"] == null
            ? null
            : List<Categoria>.from(
                json["subcategorias"].map((x) => Categoria.fromJson(x))),
        categoria: json["categoria"] == null ? null : json["categoria"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "urlBanner": urlBanner,
        "urlLogo": urlLogo,
        "subcategorias": subcategorias == null
            ? null
            : List<dynamic>.from(subcategorias.map((x) => x.toJson())),
        "categoria": categoria == null ? null : categoria,
      };
}
