import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:timer/models/timer.dart';
import 'package:timer/widgets/timerButton.dart';
import 'package:video_player/video_player.dart';

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

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CountDownTimer timer = CountDownTimer();
  VideoPlayerController _controller;

  void goToSettings(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => SettingsScreen()));
  }

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_480_1_5MG.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
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
            Center(
              child: _controller.value.initialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : Container(
                      height: 200,
                      width: 200,
                    ),
            ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
