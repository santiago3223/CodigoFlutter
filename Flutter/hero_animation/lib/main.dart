import 'package:flutter/material.dart';

import 'page2.dart';

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
      home: Page1(),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero animation"),
      ),
      body: GestureDetector(
        child: Hero(
          tag: "etiquetaIcono",
          child: Icon(
            Icons.ac_unit,
            color: Colors.green,
            size: 40,
          ),
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (c) => Page2()));
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            title: Text("Home"),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text("Cumpleaños"),
            icon: Icon(Icons.cake),
          ),
          BottomNavigationBarItem(
            title: Text("Calendario"),
            icon: Icon(Icons.calendar_today),
          ),
          BottomNavigationBarItem(
            title: Text("Alarma"),
            icon: Icon(Icons.alarm),
          ),
        ],
      ),
    );
  }
}
