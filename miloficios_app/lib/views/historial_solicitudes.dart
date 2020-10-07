import 'package:flutter/material.dart';
import 'package:miloficios_app/models/solicitud_model.dart';
import 'package:miloficios_app/providers/user_provider.dart';
import 'package:miloficios_app/utils/http_helper.dart';
import 'package:miloficios_app/views/respuestas_solicitud.dart';
import 'package:provider/provider.dart';

class HistorialSolicitudes extends StatefulWidget {
  @override
  _HistorialSolicitudesState createState() => _HistorialSolicitudesState();
}

class _HistorialSolicitudesState extends State<HistorialSolicitudes> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Historial Solicitudes"),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.inbox),
                text: "Recibidas",
              ),
              Tab(
                icon: Icon(Icons.inbox),
                text: "Pendientes",
              ),
              Tab(
                icon: Icon(Icons.inbox),
                text: "Cerradas",
              )
            ],
          ),
        ),
        body: FutureBuilder(
          future: HttpHelper().consultarSolicitudes(
              Provider.of<UserProvider>(context, listen: false).token),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<SolicitudModel> solicitudesRecibidas =
                  snapshot.data.where((item) => item.estado == 2).toList();
              List<SolicitudModel> solicitudesPendientes =
                  snapshot.data.where((item) => item.estado == 1).toList();
              List<SolicitudModel> solicitudesCerradas =
                  snapshot.data.where((item) => item.estado == 3).toList();
              return TabBarView(
                children: [
                  ListView.builder(
                    itemCount: solicitudesRecibidas.length,
                    itemBuilder: (context, index) => ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RespuestasSolicitud(),
                            ));
                      },
                      title: Text(solicitudesRecibidas[index].descripcion),
                      trailing:
                          Text(solicitudesRecibidas[index].precio.toString()),
                    ),
                  ),
                  ListView.builder(
                    itemCount: solicitudesPendientes.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(solicitudesPendientes[index].descripcion),
                      trailing:
                          Text(solicitudesPendientes[index].precio.toString()),
                    ),
                  ),
                  ListView.builder(
                    itemCount: solicitudesCerradas.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(solicitudesCerradas[index].descripcion),
                      trailing:
                          Text(solicitudesCerradas[index].precio.toString()),
                    ),
                  )
                ],
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
