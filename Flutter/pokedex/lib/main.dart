import 'package:flutter/material.dart';
import 'package:pokedex/route/pokemon_detail.dart';
import 'package:pokedex/route/pokemon_types.dart';
import 'package:pokedex/util/http_helper.dart';
import 'package:splashscreen/splashscreen.dart';

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
      home: SplashScreen(
        imageBackground: AssetImage("assets/pokedex.jpg"),
        seconds: 2,
        navigateAfterSeconds: PokeHome(),
      ),
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
  List filteredPokemons = [];
  List allPokemons = [];

  @override
  void initState() {
    helper = HttpHelper();
    super.initState();
  }

  void filterPokemon(String str) {
    if (str.length > 0) {
      filteredPokemons = [];
      allPokemons.forEach((element) {
        if (element.contains(str)) {
          filteredPokemons.add(element);
        }
      });
    } else {
      filteredPokemons = allPokemons;
    }
    setState(() {
      filteredPokemons = filteredPokemons;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokedex"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("PokeCodiGo"),
              accountEmail: null,
              currentAccountPicture: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://i.ebayimg.com/images/g/CLAAAOxyRhBSq3b5/s-l300.jpg"))),
              ),
            ),
            ListTile(
              leading: Icon(Icons.grid_on),
              title: Text("Tipos"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PokemonTypes()));
              },
            )
          ],
        ),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              filterPokemon(value);
            },
          ),
          Expanded(
            child: FutureBuilder<List>(
                future: helper.getPokemons(151),
                builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                  if (snapshot.hasData) {
                    allPokemons = snapshot.data;
                    List pokemons = filteredPokemons;
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
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PokemonTypes()));
          }),
    );
  }
}
