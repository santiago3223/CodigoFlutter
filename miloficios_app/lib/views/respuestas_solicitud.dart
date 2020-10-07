import 'package:flutter/material.dart';
import 'package:miloficios_app/providers/user_provider.dart';
import 'package:miloficios_app/utils/http_helper.dart';
import 'package:provider/provider.dart';

class RespuestasSolicitud extends StatefulWidget {
  @override
  _RespuestasSolicitudState createState() => _RespuestasSolicitudState();
}

class _RespuestasSolicitudState extends State<RespuestasSolicitud> {
  @override
  Widget build(BuildContext context) {
    HttpHelper().consultarRespuestaSolicitud(
        Provider.of<UserProvider>(context, listen: false).token);

    return Scaffold(
      appBar: AppBar(
        title: Text("Respuestas:"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => ListTile(
          title: Text("Respuesta"),
        ),
      ),
    );
  }
}
