import 'package:flutter/material.dart';
import 'package:miloficios_app/models/categoria.dart';

class ListarDetalleCategorias extends StatelessWidget {
  Categoria categoria;

  ListarDetalleCategorias(this.categoria);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: categoria.subcategorias.length,
          itemBuilder: (context, index) => ListTile(
                title: Text(categoria.subcategorias[index].nombre),
              )),
    );
  }
}
