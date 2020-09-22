import 'package:flutter/material.dart';
import 'package:marvelapi/modelos/super_heroe.dart';
import 'package:marvelapi/route/detalle_heroe.dart';
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
  int paginaActual = 1;
  List<Color> colores = [
    Colors.indigo,
    Colors.teal,
    Colors.amber,
    Colors.cyan,
    Colors.lime
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<SuperHeroe>>(
              future: HttpHelper().obtenerSuperHeroes(paginaActual),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<SuperHeroe> heroes = snapshot.data;
                  return GridView.builder(
                    itemCount: heroes.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetalleHeroe(heroes[index]),
                              ));
                        },
                        child: Card(
                          color: colores[index % colores.length],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Image.network(
                                      heroes[index].thumbnail.path +
                                          "." +
                                          heroes[index].thumbnail.extension),
                                ),
                                Text(
                                  heroes[index].name,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 14, 15]
                  .map((e) => FlatButton(
                      onPressed: () {
                        setState(() {
                          paginaActual = e;
                        });
                      },
                      child: Text(e.toString())))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
