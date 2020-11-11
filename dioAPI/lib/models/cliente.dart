// To parse this JSON data, do
//
//     final cliente = clienteFromJson(jsonString);

import 'dart:convert';

import 'package:dioAPI/models/user.dart';

Cliente clienteFromJson(String str) => Cliente.fromJson(json.decode(str));

String clienteToJson(Cliente data) => json.encode(data.toJson());

class Cliente {
  Cliente({
    this.id,
    this.user,
    this.pais,
    this.departamento,
    this.distrito,
    this.dni,
    this.telefono,
  });

  int id;
  User user;
  String pais;
  String departamento;
  String distrito;
  String dni;
  String telefono;

  factory Cliente.fromJson(Map<String, dynamic> json) => Cliente(
        id: json["id"],
        user: User.fromJson(json["user"]),
        pais: json["pais"],
        departamento: json["departamento"],
        distrito: json["distrito"],
        dni: json["dni"],
        telefono: json["telefono"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user.toJson(),
        "pais": pais,
        "departamento": departamento,
        "distrito": distrito,
        "dni": dni,
        "telefono": telefono,
      };
}
