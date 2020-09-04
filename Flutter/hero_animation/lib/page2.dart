import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    timeDilation = 5;
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero animation"),
      ),
      body: Center(
        child: Hero(
          tag: "etiquetaIcono",
          child: Icon(
            Icons.ac_unit,
            color: Colors.green,
            size: 200,
          ),
        ),
      ),
    );
  }
}
