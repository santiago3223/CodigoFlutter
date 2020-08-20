import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: PaginaPerfil2());
  }
}

class PaginaPerfil2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
              gradient: LinearGradient(colors: [
                Colors.pink.shade400,
                Colors.orange.shade300,
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            height: 350,
          )
        ],
      ),
    );
  }
}
