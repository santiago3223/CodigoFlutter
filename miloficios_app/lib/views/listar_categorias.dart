import 'package:flutter/material.dart';

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
              List<Categoria> categorias = snapshot.data;
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemCount: categorias.length,
                itemBuilder: (context, index) => Card(
                  child: Column(
                    children: [
                      Expanded(child: Image.network(categorias[index].urlLogo)),
                      Text(categorias[index].nombre),
                    ],
                  ),
                ),
              );
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
