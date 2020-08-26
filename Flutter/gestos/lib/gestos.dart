import 'package:flutter/material.dart';

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
          onPanStart: (details) {
            setState(() {
              _scrollingVertically = true;
            });
          },
          onPanEnd: (details) {
            setState(() {
              _scrollingVertically = false;
            });
          },
          onPanUpdate: (details) {
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
