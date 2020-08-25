import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DetectorGestos(),
    );
  }
}

class DetectorGestos extends StatefulWidget {
  @override
  _DetectorGestosState createState() => _DetectorGestosState();
}

class _DetectorGestosState extends State<DetectorGestos> {
  int _contador = 0;
  int _contador2 = 0;
  int _contador3 = 0;
  Offset _offsetVertical = Offset.zero;
  bool _scrollingVertically = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _contador++;
            });
          },
          child: Container(
            height: 100,
            color: Colors.grey,
            child: Text("$_contador"),
          ),
        ),
        GestureDetector(
          onDoubleTap: () {
            setState(() {
              _contador2++;
            });
          },
          child: Container(
            height: 100,
            color: Colors.grey,
            child: Text("$_contador2"),
          ),
        ),
        GestureDetector(
          onLongPress: () {
            setState(() {
              _contador3++;
            });
          },
          child: Container(
            height: 100,
            color: Colors.grey,
            child: Text("$_contador3"),
          ),
        ),
        GestureDetector(
          onVerticalDragStart: (details) {
            setState(() {
              _scrollingVertically = true;
            });
          },
          onVerticalDragEnd: (details) {
            setState(() {
              _scrollingVertically = false;
            });
          },
          onVerticalDragUpdate: (details) {
            setState(() {
              _offsetVertical += details.delta;
            });
          },
          child: Container(
            height: 200,
            color: Colors.grey,
            child: Center(
                child: Transform.translate(
                    offset: _offsetVertical,
                    child: Text(_scrollingVertically ? "Drag" : "Stop"))),
          ),
        ),
      ],
    );
  }
}
