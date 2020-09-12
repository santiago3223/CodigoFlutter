import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/util/commons.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Hero(
                  tag: id.toString(),
                  child: Image.network(
                    imageUrl + id.toString() + ".png",
                    height: 200,
                  )),
              FutureBuilder(
                  future: helper.getPokemon(id),
                  builder: (c, snapshot) {
                    if (snapshot.hasData) {
                      Pokemon pokemon = snapshot.data;
                      return buildPokemonDetail(pokemon);
                    } else if (snapshot.hasError) {
                      return Text("Error");
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPokemonDetail(Pokemon pokemon) {
    return Column(
      children: [
        Text(
          pokemon.name,
          style: Theme.of(context).textTheme.headline4,
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Peso: ${pokemon.weight}"),
            Text("Tamaño: ${pokemon.height}")
          ],
        ),
        Container(
          height: 60,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: pokemon.types.length,
              itemBuilder: (c, i) {
                return Container(
                    margin: EdgeInsets.all(15),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: colorsType[pokemon.types[i].type.name]),
                    child: Center(
                        child: Text(
                      pokemon.types[i].type.name,
                      style: TextStyle(color: Colors.white),
                    )));
              }),
        ),
        Text("Sprites:"),
        SizedBox(
          height: 16,
        ),
        Container(
          height: 100,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
              Image.network(pokemon.sprites.frontDefault),
              Image.network(pokemon.sprites.backDefault),
              Image.network(pokemon.sprites.frontShiny),
              Image.network(pokemon.sprites.backShiny)
            ],
          ),
        ),
        Text("Movimientos:"),
        SizedBox(
          height: 16,
        ),
        Container(
          height: 100,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, childAspectRatio: 8),
            itemCount: pokemon.moves.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (c, i) {
              return Text(pokemon.moves[i].move.name);
            },
          ),
        )
      ],
    );
  }
}
