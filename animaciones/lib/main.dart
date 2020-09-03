import 'package:animaciones/widgets/animated_baloon.dart';
import 'package:animaciones/widgets/animated_opacity.dart';
import 'package:animaciones/widgets/animated_container.dart';
import 'package:animaciones/widgets/animated_cross_fade.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Animaciones(),
    );
  }
}

class Animaciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animaciones"),
      ),
      body: AnimatedBalloonWidget(),
    );
  }
}
