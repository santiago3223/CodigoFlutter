import 'package:flutter/material.dart';

class TextoPruebas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: RichText(
        text: TextSpan(
          text: "prueba 1",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              letterSpacing: 5,
              wordSpacing: 10,
              decoration: TextDecoration.lineThrough,
              decorationColor: Colors.amber),
          children: [TextSpan(text: "prueba2")],
        ),
      ),
    );
  }
}
