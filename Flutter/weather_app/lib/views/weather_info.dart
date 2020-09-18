import 'package:flutter/material.dart';
import 'package:weather_app/models/forecast.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({
    Key key,
    @required this.forecast,
  }) : super(key: key);

  final Forecast forecast;

  @override
  Widget build(BuildContext context) {
    if (forecast == null) {
      return Container();
    }

    return Row(
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
    );
  }
}
