import 'package:flutter/material.dart';
import 'package:weather_app/models/forecast.dart';

class DailyForecastView extends StatelessWidget {
  const DailyForecastView({
    Key key,
    @required this.forecast,
  }) : super(key: key);

  final Forecast forecast;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text(forecast.daily[0].date.toString()),
            Text(forecast.daily[0].temp.toString())
          ],
        ),
        Image.asset(
          "assets/images/021-cloud.png",
          width: 50,
          height: 50,
        ),
        Column(
          children: [Text("Fri"), Text("21°")],
        ),
        Image.asset(
          "assets/images/021-cloud.png",
          width: 50,
          height: 50,
        ),
        Column(
          children: [Text("Fri"), Text("21°")],
        ),
        Image.asset(
          "assets/images/021-cloud.png",
          width: 50,
          height: 50,
        ),
      ],
    );
  }
}
