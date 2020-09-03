import 'package:flutter/material.dart';

import 'ball.dart';
import 'bat.dart';

class Pong extends StatefulWidget {
  @override
  _PongState createState() => _PongState();
}

class _PongState extends State<Pong> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  int movX = 1;
  int movY = 1;

  double width = 0;
  double heigth = 0;
  double posX = 0;
  double posY = 0;
  double batWidth = 0;
  double batHeight = 0;
  double batPosition = 0;

  @override
  void initState() {
    posX = 0;
    posY = 0;
    controller = AnimationController(
      vsync: this,
      duration: Duration(hours: 1),
    );
    animation = Tween(begin: 0.0, end: 100.0).animate(controller);
    animation.addListener(() {
      setState(() {
        posX += movX;
        posY += movY;
      });
      checkBorders();
    });
    controller.forward();
    super.initState();
  }

  void checkBorders() {
    if (posX >= width - 50) {
      movX = -1;
    }
    if (posY >= heigth - 50) {
      movY = -1;
    }
    if (posX <= 0) {
      movX = 1;
    }
    if (posY <= 0) {
      movY = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      width = constraints.maxWidth;
      heigth = constraints.maxHeight;
      batWidth = width / 5;
      batHeight = heigth / 20;

      return Stack(
        children: [
          Positioned(
            child: Ball(),
            top: posY,
            left: posX,
          ),
          Positioned(
            child: Bat(batWidth, batHeight),
            bottom: 0,
          )
        ],
      );
    });
  }
}
