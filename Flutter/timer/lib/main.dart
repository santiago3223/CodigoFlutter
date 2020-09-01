import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:timer/models/timer.dart';
import 'package:timer/widgets/timerButton.dart';

import 'models/timerModel.dart';

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
  CountDownTimer timer = CountDownTimer();

  @override
  Widget build(BuildContext context) {
    timer.startWork();

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
            StreamBuilder<Object>(
                stream: timer.steam(),
                builder: (context, snapshot) {
                  TimerModel model = snapshot.data;
                  return Expanded(
                    child: CircularPercentIndicator(
                      radius: 200,
                      lineWidth: 10,
                      percent: model.percent,
                      center: Text(
                        model.time,
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      progressColor: Color(0xff009688),
                    ),
                  );
                }),
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
