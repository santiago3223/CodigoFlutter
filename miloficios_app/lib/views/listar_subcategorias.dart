import 'package:flutter/material.dart';
import 'package:miloficios_app/models/categoria.dart';
import 'package:miloficios_app/views/solicitud.dart';

class ListarDetalleCategorias extends StatelessWidget {
  Categoria categoria;
  ListarDetalleCategorias(this.categoria);
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        title: Text(categoria.nombre),
      ),
      body: Column(
        children: [
          Image.network(categoria.urlBanner),
          Expanded(
            child: ListView.builder(
                itemCount: categoria.subcategorias.length,
                itemBuilder: (context, index) => ListTile(
                      onTap: () async {
                        var mensaje = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CrearSolicitud(
                                  categoria.subcategorias[index]),
                            ));
                        if (mensaje != null) {
                          scaffoldkey.currentState.showSnackBar(SnackBar(
                            content: Text(mensaje),
                          ));
                        }
                      },
                      title: Text(categoria.subcategorias[index].nombre),
                    )),
          ),
        ],
      ),
    );
  }
}
