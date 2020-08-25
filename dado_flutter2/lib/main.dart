import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PaginaDado(),
    );
  }
}

class PaginaDado extends StatefulWidget {
  @override
  _PaginaDadoState createState() => _PaginaDadoState();
}

class _PaginaDadoState extends State<PaginaDado> {
  int _numeroDado = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("dado"),
      ),
      body: Container(
        color: Colors.red,
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      _numeroDado = 1 + Random().nextInt(6);
                    });
                  },
                  child: Image(
                    image: AssetImage("assets/images/dice$_numeroDado.png"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
