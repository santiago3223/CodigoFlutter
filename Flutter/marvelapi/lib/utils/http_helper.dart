import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'package:marvelapi/modelos/comic.dart';
import 'package:marvelapi/modelos/super_heroe.dart';

class HttpHelper {
  String urlBase = "https://gateway.marvel.com/v1/public/";
  String publicKey = "7737f4a77e5ba5406c4c67dbbd3151e6";
  String privateKey = "00763b7723ab2b6d06242cc5a3e2f8ecb42741ec";

  Future<List<SuperHeroe>> obtenerSuperHeroes(int page) async {
    page = page - 1;
    String hash =
        md5.convert(utf8.encode("1" + privateKey + publicKey)).toString();

    var response = await http.get(urlBase +
        "characters?apikey=$publicKey&hash=$hash&ts=1&limit=100&offset=${page * 100}");
    List jsonResponse = jsonDecode(response.body)["data"]["results"];
    List<SuperHeroe> heroes =
        jsonResponse.map((e) => SuperHeroe.fromJson(e)).toList();

    print(response.body);
    return heroes;
  }

  Future<Comic> obtenerComic(String url) async {
    String hash =
        md5.convert(utf8.encode("1" + privateKey + publicKey)).toString();

    var response = await http.get("$url?apikey=$publicKey&hash=$hash&ts=1");
    print(response.body);
    var jsonResponse = jsonDecode(response.body)["data"]["results"][0];
    Comic comic = Comic.fromJson(jsonResponse);

    return comic;
  }
}
