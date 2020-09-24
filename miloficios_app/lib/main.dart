import 'package:flutter/material.dart';
import 'package:miloficios_app/utils/http_helper.dart';

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
      home: Categorias(),
    );
  }
}

class Categorias extends StatefulWidget {
  @override
  _CategoriasState createState() => _CategoriasState();
}

class _CategoriasState extends State<Categorias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FutureBuilder(
          future: HttpHelper().fetchCategorias(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data.toString());
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
