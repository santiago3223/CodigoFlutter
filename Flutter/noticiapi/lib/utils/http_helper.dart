import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:noticiapi/models/noticia.dart';

class HttpHelper {
  String baseUrl = "http://newsapi.org/v2/";
  String apiKey = "64ba406e93ad4cf09919bbfd94942ed6";

  Future<List<Noticia>> fetchNoticias(DateTime fecha) async {
    DateFormat formatoFecha = DateFormat("yyyy-MM-dd");
    var response = await http.get(baseUrl +
        "everything?from=${formatoFecha.format(fecha)}&to=${formatoFecha.format(fecha)}&qInTitle=peru&apiKey=" +
        apiKey);
    List noticiasJson = jsonDecode(response.body)["articles"];
    List noticias = noticiasJson.map((e) => Noticia.fromJson(e)).toList();
    return noticias;
  }
}
