import 'dart:convert';

import 'package:weather_app/models/forecast.dart';
import 'package:weather_app/models/location.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather.dart';

class OpenWeatherMapAPI {
  String url = "https://api.openweathermap.org/data/2.5/";
  String apiKey = "2de4c167e734b9df21b86b7f9a467e56";

  Future<Location> getLocation(String city) async {
    var response = await http.get("${url}weather?q=${city}&appid=${apiKey}");
    if (response.statusCode != 200) {
      throw Exception(response.body.toString());
    }
    return Location.fromJson(jsonDecode(response.body));
  }

  Future<Forecast> getForecast(Location location) async {
    var response = await http.get(
        "${url}onecall?lat=${location.latitude}&lon=${location.longitude}&exclude=hourly,minutely&appid=${apiKey}");
    if (response.statusCode != 200) {
      throw Exception(response.body.toString());
    }
    return Forecast.fromJson(jsonDecode(response.body));
  }
}
