import 'dart:convert';

import 'package:nbapp/models/equipo.dart';
import 'package:http/http.dart' as http;
import 'package:nbapp/models/jugador.dart';

class HttpHelper {
  String urlBase = "https://www.balldontlie.io/api/v1/";

  Future<List<Equipo>> fetchEquipos() async {
    var response = await http.get(urlBase + "teams");
    if (response.statusCode == 200) {
      List equipos = jsonDecode(response.body)["data"];
      return equipos.map((e) => Equipo.fromJson(e)).toList();
    } else {
      print("Error obteniendo Equipos");
      return [];
    }
  }

  Future<List<Jugador>> fetchJugadoresPorEquipo(String equipo) async {
    var response = await http
        .get("http://data.nba.net/json/cms/noseason/team/$equipo/roster.json");
    if (response.statusCode == 200) {
      List jugadores = jsonDecode(response.body)["sports_content"]["roster"]
          ["players"]["player"];
      return jugadores.map((e) => Jugador.fromJson(e)).toList();
    } else {
      print("Error obteniendo Equipos");
      return [];
    }
  }
}
