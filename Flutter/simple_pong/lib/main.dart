import 'package:flutter/material.dart';
import 'package:simple_pong/widgets/ball.dart';
import 'package:simple_pong/widgets/bat.dart';
import 'package:simple_pong/widgets/pong.dart';

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
      home: SimplePong(),
    );
  }
}

class SimplePong extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Pong"),
      ),
      body: Container(
        child: Pong(),
      ),
    );
  }
}
