import 'dart:convert';

import 'package:flutter/painting.dart';
import 'package:miloficios_app/models/banner_publicitario.dart';
import 'package:miloficios_app/models/categoria.dart';
import 'package:http/http.dart' as http;

class HttpHelper {
  String urlBase = "http://192.168.1.5:8000/API/";

  Future<List<Categoria>> fetchCategorias() async {
    var response = await http.get(urlBase + "categoriasList/");
    List categoriasJson = jsonDecode(response.body);

    return categoriasJson.map((e) => Categoria.fromJson(e)).toList();
  }

  Future<List<BannerPublicitario>> fetchBannersPublicitarios() async {
    var response = await http.get(urlBase + "bannerspublicitarios/");
    List categoriasJson = jsonDecode(response.body);
    return categoriasJson.map((e) => BannerPublicitario.fromJson(e)).toList();
  }

  Future<String> iniciarSesion(String username, String password) async {
    var response = await http.post(urlBase + "token-auth/",
        body: {"username": username, "password": password});

    if (response.statusCode == 200) {
      String token = jsonDecode(response.body)["token"];
      return token;
    }
    return "";
  }

  Future<bool> registrarUsuario(String usuario, String password, String correo,
      String nombre, String apellido, String dni) async {
    var response = await http.post(urlBase + "clienteRegister/", body: {
      "username": usuario,
      "password": password,
      "email": correo,
      "first_name": nombre,
      "last_name": apellido,
      "dni": dni
    });
    print(response.body);
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> consultarUsuario() async {
    var response = await http.get(
      urlBase + "/clienteRetrieve/8/",
    );
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}