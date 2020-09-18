import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/forecast.dart';
import 'package:weather_app/models/location.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/viewmodels/weather_provider.dart';
import 'package:weather_app/views/weather_info.dart';

import 'daily_forecast_view.dart';
import 'gradient_container.dart';
import 'location_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Forecast forecast = Provider.of<WeatherProvider>(context).forecast;
    Location location = Provider.of<WeatherProvider>(context).location;
    String city = Provider.of<WeatherProvider>(context).city;

    return Scaffold(
      body: _buildGradientContainer(
          true,
          forecast == null
              ? WeatherCondition.clear
              : forecast.current.condition,
          ListView(
            children: [
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(3),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: Offset(0, 3))
                    ]),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {},
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration.collapsed(
                            hintText: "Ingrese Ciudad"),
                        onSubmitted: (value) async {
                          Provider.of<WeatherProvider>(context, listen: false)
                              .fetchForecast(value);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              LocationView(city: city, location: location),
              SizedBox(
                height: 24,
              ),
              WeatherInfo(forecast: forecast),
              SizedBox(
                height: 24,
              ),
              Center(
                child: Text(
                  forecast != null ? forecast.current.description : "Clima",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.w300),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              DailyForecastView(forecast: forecast),
              SizedBox(
                height: 20,
              ),
              Center(
                  child: forecast != null
                      ? Text("Last Update: " +
                          DateFormat.Hm().format(forecast.lastUpdated))
                      : Text("00:00"))
            ],
          )),
    );
  }

  GradientContainer _buildGradientContainer(
      bool isDayTime, WeatherCondition condition, Widget child) {
    GradientContainer container;
    if (!isDayTime) {
      container = GradientContainer(color: Colors.blueGrey, child: child);
    } else {
      switch (condition) {
        case WeatherCondition.clear:
        case WeatherCondition.lightCloud:
          container = GradientContainer(color: Colors.yellow, child: child);
          break;
        case WeatherCondition.fog:
        case WeatherCondition.atmosphere:
        case WeatherCondition.rain:
        case WeatherCondition.drizzle:
        case WeatherCondition.mist:
        case WeatherCondition.heavyCloud:
          container = GradientContainer(color: Colors.indigo, child: child);
          break;
        case WeatherCondition.snow:
          container = GradientContainer(color: Colors.lightBlue, child: child);
          break;
        case WeatherCondition.thunderstorm:
          container = GradientContainer(color: Colors.deepPurple, child: child);
          break;
        default:
          container = GradientContainer(color: Colors.lightBlue, child: child);
      }
    }
    return container;
  }
}
