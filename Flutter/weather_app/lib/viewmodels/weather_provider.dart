import 'package:flutter/cupertino.dart';
import 'package:weather_app/api/owm_api.dart';
import 'package:weather_app/models/forecast.dart';
import 'package:weather_app/models/location.dart';

class WeatherProvider extends ChangeNotifier {
  Forecast forecast;
  Location location = new Location(latitude: 0, longitude: 0);
  String city;

  Future fetchForecast(String value) async {
    city = value;
    OpenWeatherMapAPI api = OpenWeatherMapAPI();
    location = await api.getLocation(value);
    forecast = await api.getForecast(location);
    print("Forecast Updated");
    notifyListeners();
  }
}
