import 'package:flutter/material.dart';
import 'package:pokedex/route/pokemon_detail.dart';
import 'package:pokedex/util/http_helper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PokeHome(),
    );
  }
}

class PokeHome extends StatefulWidget {
  @override
  _PokeHomeState createState() => _PokeHomeState();
}

class _PokeHomeState extends State<PokeHome> {
  HttpHelper helper;
  String imageUrl = "https://pokeres.bastionbot.org/images/pokemon/";

  @override
  void initState() {
    helper = HttpHelper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokedex"),
      ),
      body: FutureBuilder<List>(
          future: helper.getPokemons(151),
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            if (snapshot.hasData) {
              List pokemons = snapshot.data;
              return ListView.builder(
                  itemCount: pokemons.length,
                  itemBuilder: (c, i) => ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (c) => PokemonDetail(i + 1)));
                        },
                        leading: Text((i + 1).toString()),
                        title: Text(pokemons[i]),
                        trailing: Hero(
                          tag: (i + 1).toString(),
                          child: Image.network(
                              imageUrl + (i + 1).toString() + ".png"),
                        ),
                      ));
            } else if (snapshot.hasError) {
              return Text("Tiene Error");
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            helper.getPokemons(150);
          }),
    );
  }
}
