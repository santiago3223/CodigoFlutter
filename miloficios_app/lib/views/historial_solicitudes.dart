import 'package:flutter/material.dart';
import 'package:miloficios_app/providers/user_provider.dart';
import 'package:miloficios_app/utils/http_helper.dart';
import 'package:provider/provider.dart';

class HistorialSolicitudes extends StatefulWidget {
  @override
  _HistorialSolicitudesState createState() => _HistorialSolicitudesState();
}

class _HistorialSolicitudesState extends State<HistorialSolicitudes> {
  @override
  Widget build(BuildContext context) {
    HttpHelper().consultarSolicitudes(
        Provider.of<UserProvider>(context, listen: false).token);
    return Scaffold(
      appBar: AppBar(
        title: Text("Historial Solicitudes"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => ListTile(
          title: Text("Solicitud"),
        ),
      ),
    );
  }
}
