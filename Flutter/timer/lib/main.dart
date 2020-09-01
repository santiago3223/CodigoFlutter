import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:timer/widgets/timerButton.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Timer"),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TimerButton(
                        color: Color(0xff009688),
                        text: "Trabajo",
                        size: 100,
                        onPressed: () {}),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: TimerButton(
                        color: Color(0xff607D8B),
                        text: "Break corto",
                        size: 100,
                        onPressed: () {}),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: TimerButton(
                        color: Color(0xff455A64),
                        text: "Break largo",
                        size: 100,
                        onPressed: () {}),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CircularPercentIndicator(
                radius: 200,
                lineWidth: 10,
                percent: 0.5,
                center: Text(
                  "30:00",
                  style: Theme.of(context).textTheme.headline2,
                ),
                progressColor: Color(0xff009688),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TimerButton(
                        color: Color(0xff212121),
                        text: "Stop",
                        size: 100,
                        onPressed: () {}),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: TimerButton(
                        color: Color(0xff009688),
                        text: "Restart",
                        size: 100,
                        onPressed: () {}),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
