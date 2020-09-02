import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:timer/models/timer.dart';
import 'package:timer/widgets/timerButton.dart';

import 'models/timerModel.dart';
import 'screens/settings.dart';

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

  void goToSettings(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => SettingsScreen()));
  }

  @override
  Widget build(BuildContext context) {
    List<PopupMenuItem> menuItems = List();
    menuItems
        .add(PopupMenuItem(child: Text('Configuración'), value: "settings"));

    return Scaffold(
      appBar: AppBar(
        title: Text("Timer"),
        actions: [
          PopupMenuButton(
            itemBuilder: (_) {
              return menuItems.toList();
            },
            onSelected: (route) {
              if (route == "settings") {
                goToSettings(context);
              }
            },
          )
        ],
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
                        onPressed: () {
                          timer.startWork();
                        }),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: TimerButton(
                        color: Color(0xff607D8B),
                        text: "Break corto",
                        size: 100,
                        onPressed: () {
                          timer.startBreak(true);
                        }),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: TimerButton(
                        color: Color(0xff455A64),
                        text: "Break largo",
                        size: 100,
                        onPressed: () {
                          timer.startBreak(false);
                        }),
                  ),
                ],
              ),
            ),
            StreamBuilder<Object>(
                stream: timer.steam(),
                builder: (context, snapshot) {
                  TimerModel model;
                  if (snapshot.data != null) {
                    model = snapshot.data;
                  } else {
                    model = TimerModel("00:00", 0);
                  }
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
                        onPressed: () {
                          timer.stopTimer();
                        }),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: TimerButton(
                        color: Color(0xff009688),
                        text: "Restart",
                        size: 100,
                        onPressed: () {
                          timer.startTimer();
                        }),
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
