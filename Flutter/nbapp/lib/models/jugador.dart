// To parse this JSON data, do
//
//     final jugador = jugadorFromJson(jsonString);

import 'dart:convert';

Jugador jugadorFromJson(String str) => Jugador.fromJson(json.decode(str));

String jugadorToJson(Jugador data) => json.encode(data.toJson());

class Jugador {
  Jugador({
    this.firstName,
    this.lastName,
    this.sortLetter,
    this.displayName,
    this.playerCode,
    this.heightFt,
    this.heightIn,
    this.weightLbs,
    this.isOrlando,
    this.isSacramento,
    this.isLasVegas,
    this.isUtah,
    this.isAfrica,
    this.leagueId,
    this.jerseyNumber,
    this.positionFull,
    this.positionShort,
    this.isCptn,
    this.faDspl,
    this.affiliation,
    this.birthDate,
    this.yearsPro,
    this.eliasCountry,
    this.personId,
  });

  String firstName;
  String lastName;
  String sortLetter;
  String displayName;
  String playerCode;
  String heightFt;
  String heightIn;
  String weightLbs;
  String isOrlando;
  String isSacramento;
  String isLasVegas;
  String isUtah;
  String isAfrica;
  String leagueId;
  String jerseyNumber;
  String positionFull;
  String positionShort;
  String isCptn;
  String faDspl;
  String affiliation;
  String birthDate;
  String yearsPro;
  String eliasCountry;
  String personId;

  factory Jugador.fromJson(Map<String, dynamic> json) => Jugador(
        firstName: json["first_name"],
        lastName: json["last_name"],
        sortLetter: json["sort_letter"],
        displayName: json["display_name"],
        playerCode: json["player_code"],
        heightFt: json["height_ft"],
        heightIn: json["height_in"],
        weightLbs: json["weight_lbs"],
        isOrlando: json["isOrlando"],
        isSacramento: json["isSacramento"],
        isLasVegas: json["isLasVegas"],
        isUtah: json["isUtah"],
        isAfrica: json["isAfrica"],
        leagueId: json["league_id"],
        jerseyNumber: json["jersey_number"],
        positionFull: json["position_full"],
        positionShort: json["position_short"],
        isCptn: json["is_cptn"],
        faDspl: json["fa_dspl"],
        affiliation: json["affiliation"],
        birthDate: json["birth_date"],
        yearsPro: json["years_pro"],
        eliasCountry: json["elias_country"],
        personId: json["person_id"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "sort_letter": sortLetter,
        "display_name": displayName,
        "player_code": playerCode,
        "height_ft": heightFt,
        "height_in": heightIn,
        "weight_lbs": weightLbs,
        "isOrlando": isOrlando,
        "isSacramento": isSacramento,
        "isLasVegas": isLasVegas,
        "isUtah": isUtah,
        "isAfrica": isAfrica,
        "league_id": leagueId,
        "jersey_number": jerseyNumber,
        "position_full": positionFull,
        "position_short": positionShort,
        "is_cptn": isCptn,
        "fa_dspl": faDspl,
        "affiliation": affiliation,
        "birth_date": birthDate,
        "years_pro": yearsPro,
        "elias_country": eliasCountry,
        "person_id": personId,
      };
}
