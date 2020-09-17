import 'package:flutter/material.dart';
import 'package:weather_app/api/owm_api.dart';
import 'package:weather_app/models/forecast.dart';
import 'package:weather_app/models/location.dart';
import 'package:weather_app/models/weather.dart';

import 'gradient_container.dart';
import 'location_view.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Forecast forecast;
  Location location = new Location(latitude: 0, longitude: 0);
  String city = "Ciudad";

  @override
  Widget build(BuildContext context) {
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
                          city = value;
                          OpenWeatherMapAPI api = OpenWeatherMapAPI();
                          location = await api.getLocation(value);
                          forecast = await api.getForecast(location);
                          print(forecast.current.condition.toString());
                          setState(() {
                            city = city;
                            location = location;
                            forecast = forecast;
                          });
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        "${forecast.current.temp}°",
                        style: TextStyle(
                            fontSize: 50,
                            color: Colors.white,
                            fontWeight: FontWeight.w300),
                      ),
                      Text(
                        "Sensación termica ${forecast.current.feelLikeTemp}°",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  Image.asset(
                    "assets/images/021-cloud.png",
                    height: 100,
                    width: 100,
                  )
                ],
              )
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
