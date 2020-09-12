import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class HttpHelper {
  String baseUrl = "https://pokeapi.co/api/v2/";

  Future<List> getPokemons(int limit) async {
    var response =
        await http.get(baseUrl + "pokemon?limit=" + limit.toString());
    if (response.statusCode == 200) {
      var jsonReponse = convert.jsonDecode(response.body);
      List pokemons = jsonReponse["results"];
      List pokemonNames = pokemons.map((e) => e["name"]).toList();
      print(pokemonNames);
      return pokemonNames;
    } else {
      print(response.statusCode);
    }
  }
}
