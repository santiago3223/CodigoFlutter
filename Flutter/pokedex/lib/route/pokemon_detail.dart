import 'package:flutter/material.dart';

class PokemonDetail extends StatefulWidget {
  int id;

  PokemonDetail(this.id);

  @override
  _PokemonDetailState createState() => _PokemonDetailState(id);
}

class _PokemonDetailState extends State<PokemonDetail> {
  int id;
  String imageUrl = "https://pokeres.bastionbot.org/images/pokemon/";

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
              child: Image.network(imageUrl + id.toString() + ".png"))
        ],
      ),
    );
  }
}
