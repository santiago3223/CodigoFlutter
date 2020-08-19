import 'package:contador/widgetcardauto.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: PaginaAutos(nombre: "AppAutos"));
  }
}

class PaginaAutos extends StatelessWidget {
  final String nombre;

  PaginaAutos({this.nombre});

  @override
  Widget build(BuildContext context) {
    Widget card = Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Column(
            children: [
              Text("VW"),
              Text("Gol"),
              Image.network(
                  "https://acs2.blob.core.windows.net/imgcatalogo/m/VA_674e942d8f56473bafccf1184a89712c.jpg"),
            ],
          ),
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(nombre),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildAutoCard(),
              card,
              WidgetCardAuto(
                marca: "Toyota",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAutoCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Column(
            children: [
              Text("VW"),
              Text("Gol"),
              Image.network(
                  "https://acs2.blob.core.windows.net/imgcatalogo/m/VA_674e942d8f56473bafccf1184a89712c.jpg"),
            ],
          ),
        ),
      ),
    );
  }
}
