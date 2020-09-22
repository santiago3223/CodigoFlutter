import 'package:flutter/material.dart';
import 'package:marvelapi/modelos/super_heroe.dart';
import 'package:marvelapi/utils/http_helper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeSuperHeroes(),
    );
  }
}

class HomeSuperHeroes extends StatefulWidget {
  @override
  _HomeSuperHeroesState createState() => _HomeSuperHeroesState();
}

class _HomeSuperHeroesState extends State<HomeSuperHeroes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<SuperHeroe>>(
        future: HttpHelper().obtenerSuperHeroes(1),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text("tiene data");
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        HttpHelper().obtenerSuperHeroes(1);
      }),
    );
  }
}
