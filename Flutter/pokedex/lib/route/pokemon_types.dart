import 'package:flutter/material.dart';
import 'package:pokedex/util/commons.dart';
import 'package:pokedex/util/http_helper.dart';

class PokemonTypes extends StatefulWidget {
  @override
  _PokemonTypesState createState() => _PokemonTypesState();
}

class _PokemonTypesState extends State<PokemonTypes> {
  HttpHelper helper;
  @override
  void initState() {
    helper = HttpHelper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tipos"),
      ),
      body: FutureBuilder(
          future: helper.getTypes(),
          builder: (c, snapshot) {
            if (snapshot.hasData) {
              List types = snapshot.data;
              return ListView.builder(
                  itemCount: types.length,
                  itemBuilder: (c, i) => Card(
                        color: colorsType[types[i]],
                        child: ListTile(
                          title: Text(types[i]),
                        ),
                      ));
            } else if (snapshot.hasError) {
              return Text("Error");
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
