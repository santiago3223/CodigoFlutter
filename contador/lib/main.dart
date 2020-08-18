import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  void contactanos(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("contactanos"),
          content: Text("contacto codigo"),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hola CodiGo"),
          backgroundColor: Colors.deepPurple,
        ),
        body: Center(
          child: Column(children: [
            Text(
              "Hola Santiago",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.amber,
              ),
            ),
            Text(
              "A programar",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            Image.network(
              'https://images.freeimages.com/images/large-previews/eaa/the-beach-1464354.jpg',
              height: 200,
            ),
            RaisedButton(
              child: Text("presioname"),
              onPressed: () => contactanos(context),
            )
          ]),
        ),
      ),
    );
  }
}
