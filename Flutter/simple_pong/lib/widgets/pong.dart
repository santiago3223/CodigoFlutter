import 'dart:math';

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
  int score = 0;

  double randX = 0;
  double randY = 0;

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
        posX += movX * 5 * randX;
        posY += movY * 5 * randY;
      });
      checkBorders();
    });
    controller.forward();
    super.initState();
  }

  void checkBorders() {
    if (posX >= width - 50) {
      setState(() {
        randX = (Random().nextInt(10) + 1) / 10;
      });
      movX = -1;
    }
    if (posY >= heigth - 50 - batHeight) {
      setState(() {
        randY = (Random().nextInt(10) + 1) / 10;
      });

      movY = -1;
      if (batPosition <= posX && batPosition + batWidth >= posX) {
        setState(() {
          score++;
        });
      }
    }
    if (posX <= 0) {
      setState(() {
        randX = (Random().nextInt(10) + 1) / 10;
      });
      movX = 1;
    }
    if (posY <= 0) {
      setState(() {
        randY = (Random().nextInt(10) + 1) / 10;
      });
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
            child: Text("Score: $randX"),
            top: 10,
            right: 10,
          ),
          Positioned(
            child: Ball(),
            top: posY,
            left: posX,
          ),
          Positioned(
            child: GestureDetector(
                onHorizontalDragUpdate: (update) {
                  setState(() {
                    batPosition += update.delta.dx;
                  });
                },
                child: Bat(batWidth, batHeight)),
            bottom: 0,
            left: batPosition,
          )
        ],
      );
    });
  }
}
