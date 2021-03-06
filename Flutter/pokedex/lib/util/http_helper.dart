import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:pokedex/models/pokemon.dart';

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

  Future<Pokemon> getPokemon(int id) async {
    var response = await http.get(baseUrl + "pokemon/" + id.toString() + "/");
    if (response.statusCode == 200) {
      var jsonReponse = convert.jsonDecode(response.body);
      Pokemon pokemon = Pokemon.fromJson(jsonReponse);
      return pokemon;
    } else {
      print(response.statusCode);
    }
  }

  Future<List> getTypes() async {
    var response = await http.get(baseUrl + "type/");
    if (response.statusCode == 200) {
      var jsonReponse = convert.jsonDecode(response.body);
      List types = jsonReponse["results"];
      List typeNames = types.map((e) => e["name"]).toList();
      print(typeNames);
      return typeNames;
    } else {
      print(response.statusCode);
    }
  }

  Future<List> getPokemonByType(int id) async {
    var response = await http.get(baseUrl + "type/" + id.toString() + "/");
    if (response.statusCode == 200) {
      var jsonReponse = convert.jsonDecode(response.body);
      var pokemons = jsonReponse["pokemon"];
      List pokemon = pokemons.map((e) => e["pokemon"]).toList();
      return pokemon;
    } else {
      print(response.statusCode);
    }
  }
}
