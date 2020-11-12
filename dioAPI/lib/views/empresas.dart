import 'package:dio/dio.dart';
import 'package:dioAPI/models/empresa.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../rest_api.dart';

class EmpresasView extends StatefulWidget {
  @override
  _EmpresasViewState createState() => _EmpresasViewState();
}

class _EmpresasViewState extends State<EmpresasView> {
  List<Empresa> empresas = [];

  consultarEmpresas() async {
    var dio = Dio();
    var client = CodigoApi(dio);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int id = prefs.getInt("id");

    client.listarEmpresas(id.toString()).then((value) async {
      setState(() {
        empresas = value;
      });
    }).catchError((obj) {
      print(obj);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    consultarEmpresas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (Text("Empresas")),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: empresas.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(empresas[index].nombre),
          ),
        ),
      ),
    );
  }
}
