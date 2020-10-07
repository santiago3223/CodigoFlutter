import 'dart:convert';

import 'package:flutter/painting.dart';
import 'package:miloficios_app/models/banner_publicitario.dart';
import 'package:miloficios_app/models/categoria.dart';
import 'package:http/http.dart' as http;
import 'package:miloficios_app/models/solicitud_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HttpHelper {
  String urlBase = "http://gateway.evolutionsoluciones.com:8000/API/";

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

  Future consultarUsuario(String token) async {
    var response = await http.get(urlBase + "clienteRetrieve/",
        headers: {"Authorization": "JWT " + token});
    print(response.body);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var prefs = await SharedPreferences.getInstance();
      prefs.setString("username", json["username"]);
      prefs.setString("email", json["email"]);
      prefs.setString("first_name", json["first_name"]);
      prefs.setString("last_name", json["last_name"]);
      prefs.setString("dni", json["dni"]);
    }
  }

  Future<bool> registrarSolicitud(String descripcion, String precio,
      String subcategoria, String token) async {
    var response = await http.post(urlBase + "solicitudes/", headers: {
      "Authorization": "JWT " + token
    }, body: {
      "descripcion": descripcion,
      "precio": precio,
      "subCategoria": subcategoria,
    });
    print(response.body);
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<SolicitudModel>> consultarSolicitudes(String token) async {
    var response = await http.get(
      urlBase + "solicitudes/",
      headers: {"Authorization": "JWT " + token},
    );
    print(response.body);
    if (response.statusCode == 200) {
      List solicitudesJson = jsonDecode(response.body);
      return solicitudesJson.map((e) => SolicitudModel.fromJson(e)).toList();
    }
    return null;
  }

  Future consultarRespuestaSolicitud(String token) async {
    var response = await http.get(
      urlBase + "respuestassolicitud/",
      headers: {"Authorization": "JWT " + token},
    );
    print(response.body);
  }
}
