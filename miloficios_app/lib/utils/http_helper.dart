import 'dart:convert';

import 'package:miloficios_app/models/categoria.dart';
import 'package:http/http.dart' as http;

class HttpHelper {
  String urlBase = "http://192.168.1.5:8000/API/";

  Future<List<Categoria>> fetchCategorias() async {
    var response = await http.get(urlBase + "categoriasList/");
    List categoriasJson = jsonDecode(response.body);
    return categoriasJson.map((e) => Categoria.fromJson(e)).toList();
  }
}
