import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: RivePage(),
    );
  }
}

class RivePage extends StatefulWidget {
  @override
  _RiveState createState() => _RiveState();
}

class _RiveState extends State<RivePage> {
  Artboard _artboard;
  RiveAnimationController _controller;

  @override
  void initState() {
    super.initState();
    rootBundle.load('assets/flare.riv').then((value) {
      var file = RiveFile();
      file.import(value);
      _controller = SimpleAnimation('idle');

      setState(() {
        _artboard = file.mainArtboard;
      });
      _artboard.addController(_controller);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _artboard == null ? Container() : Rive(artboard: _artboard),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.isActive = !_controller.isActive;
          });
        },
      ),
    );
  }
}
