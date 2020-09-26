import 'package:flutter/material.dart';
import 'package:miloficios_app/views/listar_categorias.dart';

import 'utils/session_helper.dart';
import 'views/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  bool logedIn = false;

  setLogedIn(bool iniciaSesion) {
    setState(() {
      logedIn = iniciaSesion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: logedIn ? Categorias() : Login(this),
    );
  }
}
