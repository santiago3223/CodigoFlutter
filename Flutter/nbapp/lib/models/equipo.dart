// To parse this JSON data, do
//
//     final equipo = equipoFromJson(jsonString);

import 'dart:convert';

Equipo equipoFromJson(String str) => Equipo.fromJson(json.decode(str));

String equipoToJson(Equipo data) => json.encode(data.toJson());

class Equipo {
  Equipo({
    this.id,
    this.abbreviation,
    this.city,
    this.conference,
    this.division,
    this.fullName,
    this.name,
  });

  int id;
  String abbreviation;
  String city;
  String conference;
  String division;
  String fullName;
  String name;

  factory Equipo.fromJson(Map<String, dynamic> json) => Equipo(
        id: json["id"],
        abbreviation: json["abbreviation"],
        city: json["city"],
        conference: json["conference"],
        division: json["division"],
        fullName: json["full_name"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "abbreviation": abbreviation,
        "city": city,
        "conference": conference,
        "division": division,
        "full_name": fullName,
        "name": name,
      };
}
