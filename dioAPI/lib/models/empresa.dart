// To parse this JSON data, do
//
//     final empresa = empresaFromJson(jsonString);

import 'dart:convert';

Empresa empresaFromJson(String str) => Empresa.fromJson(json.decode(str));

String empresaToJson(Empresa data) => json.encode(data.toJson());

class Empresa {
  Empresa({
    this.id,
    this.sucursal,
    this.favorito,
    this.nombre,
    this.isotipo,
    this.logotipo,
    this.banner,
    this.tipoCuenta,
    this.cantidadCajas,
    this.cantidadMonitores,
    this.cantidadSucursales,
  });

  int id;
  List<Sucursal> sucursal;
  bool favorito;
  String nombre;
  dynamic isotipo;
  dynamic logotipo;
  dynamic banner;
  int tipoCuenta;
  int cantidadCajas;
  int cantidadMonitores;
  int cantidadSucursales;

  factory Empresa.fromJson(Map<String, dynamic> json) => Empresa(
        id: json["id"],
        sucursal: List<Sucursal>.from(
            json["sucursal"].map((x) => Sucursal.fromJson(x))),
        favorito: json["favorito"],
        nombre: json["nombre"],
        isotipo: json["isotipo"],
        logotipo: json["logotipo"],
        banner: json["banner"],
        tipoCuenta: json["tipo_cuenta"],
        cantidadCajas: json["cantidad_cajas"],
        cantidadMonitores: json["cantidad_monitores"],
        cantidadSucursales: json["cantidad_sucursales"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sucursal": List<dynamic>.from(sucursal.map((x) => x.toJson())),
        "favorito": favorito,
        "nombre": nombre,
        "isotipo": isotipo,
        "logotipo": logotipo,
        "banner": banner,
        "tipo_cuenta": tipoCuenta,
        "cantidad_cajas": cantidadCajas,
        "cantidad_monitores": cantidadMonitores,
        "cantidad_sucursales": cantidadSucursales,
      };
}

class Sucursal {
  Sucursal({
    this.id,
    this.tipoCaja,
    this.nombre,
    this.pais,
    this.departamento,
    this.distrito,
    this.direccion,
    this.telefono1,
    this.telefono2,
    this.mail,
    this.tituloCajas,
    this.empresa,
  });

  int id;
  List<TipoCaja> tipoCaja;
  String nombre;
  String pais;
  String departamento;
  String distrito;
  String direccion;
  String telefono1;
  dynamic telefono2;
  dynamic mail;
  String tituloCajas;
  int empresa;

  factory Sucursal.fromJson(Map<String, dynamic> json) => Sucursal(
        id: json["id"],
        tipoCaja: List<TipoCaja>.from(
            json["tipo_caja"].map((x) => TipoCaja.fromJson(x))),
        nombre: json["nombre"],
        pais: json["pais"],
        departamento: json["departamento"],
        distrito: json["distrito"],
        direccion: json["direccion"],
        telefono1: json["telefono1"],
        telefono2: json["telefono2"],
        mail: json["mail"],
        tituloCajas: json["tituloCajas"],
        empresa: json["empresa"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tipo_caja": List<dynamic>.from(tipoCaja.map((x) => x.toJson())),
        "nombre": nombre,
        "pais": pais,
        "departamento": departamento,
        "distrito": distrito,
        "direccion": direccion,
        "telefono1": telefono1,
        "telefono2": telefono2,
        "mail": mail,
        "tituloCajas": tituloCajas,
        "empresa": empresa,
      };
}

class TipoCaja {
  TipoCaja({
    this.pk,
    this.nombre,
  });

  int pk;
  String nombre;

  factory TipoCaja.fromJson(Map<String, dynamic> json) => TipoCaja(
        pk: json["pk"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toJson() => {
        "pk": pk,
        "nombre": nombre,
      };
}
