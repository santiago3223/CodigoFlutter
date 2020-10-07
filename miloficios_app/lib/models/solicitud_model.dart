// To parse this JSON data, do
//
//     final solicitudModel = solicitudModelFromJson(jsonString);

import 'dart:convert';

SolicitudModel solicitudModelFromJson(String str) =>
    SolicitudModel.fromJson(json.decode(str));

String solicitudModelToJson(SolicitudModel data) => json.encode(data.toJson());

class SolicitudModel {
  SolicitudModel(
      {this.subCategoria,
      this.descripcion,
      this.precio,
      this.cliente,
      this.estado});

  int subCategoria;
  String descripcion;
  double precio;
  int cliente;
  int estado;

  factory SolicitudModel.fromJson(Map<String, dynamic> json) => SolicitudModel(
        subCategoria: json["subCategoria"],
        descripcion: json["descripcion"],
        precio: json["precio"],
        cliente: json["cliente"],
        estado: json["estado"],
      );

  Map<String, dynamic> toJson() => {
        "subCategoria": subCategoria,
        "descripcion": descripcion,
        "precio": precio,
        "cliente": cliente,
        "estado": estado,
      };
}
