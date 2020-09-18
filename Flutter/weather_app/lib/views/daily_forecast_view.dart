import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/forecast.dart';
import 'package:weather_app/models/weather.dart';

class DailyForecastView extends StatelessWidget {
  const DailyForecastView({
    Key key,
    @required this.forecast,
  }) : super(key: key);

  final Forecast forecast;

  String formatTemp(double temp) {
    temp -= 273.15;
    return temp.round().toString();
  }

  String formatDay(DateTime date) {
    return DateFormat("EEE").format(date);
  }

  @override
  Widget build(BuildContext context) {
    if (forecast == null) {
      return Container();
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text("${formatDay(forecast.daily[0].date)}",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w300)),
            Text("${formatTemp(forecast.daily[0].temp)}°",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w300))
          ],
        ),
        buildWeatherImage(forecast.daily[0].condition),
        Column(
          children: [
            Text("${formatDay(forecast.daily[1].date)}",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w300)),
            Text("${formatTemp(forecast.daily[1].temp)}°",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w300))
          ],
        ),
        buildWeatherImage(forecast.daily[1].condition),
        Column(
          children: [
            Text("${formatDay(forecast.daily[2].date)}",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w300)),
            Text("${formatTemp(forecast.daily[2].temp)}°",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w300))
          ],
        ),
        buildWeatherImage(forecast.daily[2].condition),
      ],
    );
  }

  Image buildWeatherImage(WeatherCondition condition) {
    String imageString = "assets/images/021-cloud.png";

    switch (condition) {
      case WeatherCondition.clear:
      case WeatherCondition.lightCloud:
        imageString = "assets/images/021-sun.png";
        break;
      case WeatherCondition.fog:
      case WeatherCondition.atmosphere:
      case WeatherCondition.rain:
      case WeatherCondition.drizzle:
      case WeatherCondition.mist:
      case WeatherCondition.heavyCloud:
        imageString = "assets/images/021-cloudy.png";
        break;
      case WeatherCondition.snow:
        imageString = "assets/images/021-snowing-1.png";
        break;
      case WeatherCondition.thunderstorm:
        imageString = "assets/images/021-rain-1.png";
        break;
      default:
        imageString = "assets/images/021-cloudy.png";
    }
    return Image.asset(
      imageString,
      height: 50,
      width: 50,
    );
  }
}
