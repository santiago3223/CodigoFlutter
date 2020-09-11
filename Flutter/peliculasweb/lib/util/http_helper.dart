import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:peliculasweb/models/movie.dart';

class HttpHelper {
  String urlkey = "api_key=aaf0f6007bb77eb949b1c0b23578d774";
  String urlBase = "https://api.themoviedb.org/3/movie";
  String urlUpcoming = "/upcoming?";
  String urlLanguage = "&language=en-US";

  Future<List> getUpcoming() async {
    String upcoming = urlBase + urlUpcoming + urlkey + urlLanguage;
    http.Response result = await http.get(upcoming);
    if (result.statusCode == HttpStatus.ok) {
      dynamic jsonResponse = json.decode(result.body);
      dynamic moviesMap = jsonResponse["results"];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      return null;
    }
  }
}
