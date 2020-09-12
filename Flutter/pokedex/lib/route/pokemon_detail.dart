import 'package:flutter/material.dart';
import 'package:pokedex/util/http_helper.dart';

class PokemonDetail extends StatefulWidget {
  int id;

  PokemonDetail(this.id);

  @override
  _PokemonDetailState createState() => _PokemonDetailState(id);
}

class _PokemonDetailState extends State<PokemonDetail> {
  int id;
  HttpHelper helper;
  String imageUrl = "https://pokeres.bastionbot.org/images/pokemon/";

  @override
  void initState() {
    helper = HttpHelper();
    super.initState();
  }

  _PokemonDetailState(this.id);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokemon seleccionado"),
      ),
      body: Column(
        children: [
          Hero(
              tag: id.toString(),
              child: Image.network(imageUrl + id.toString() + ".png")),
          FutureBuilder(
              future: helper.getPokemon(id),
              builder: (c, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data.name);
                } else if (snapshot.hasError) {}
                return Text("Cargando");
              })
        ],
      ),
    );
  }
}
