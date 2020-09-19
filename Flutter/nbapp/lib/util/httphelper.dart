import 'dart:convert';

import 'package:nbapp/models/equipo.dart';
import 'package:http/http.dart' as http;

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
}
