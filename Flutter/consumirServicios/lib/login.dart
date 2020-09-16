import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usuario = TextEditingController();
  TextEditingController trabajo = TextEditingController();
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();
  String tokenUsuario = "";
  bool estaCargando = false;

  Future<String> crearUsuario() async {
    setState(() {
      estaCargando = true;
    });
    var response = await http.post("https://viveyupi.com/api/api-token-auth/",
        body: {"username": usuario.text, "password": trabajo.text});
    setState(() {
      estaCargando = false;
    });
    var respJson = jsonDecode(response.body);
    tokenUsuario = respJson["token"];
    return tokenUsuario;
  }

  Future<String> consultarUsuario() async {
    setState(() {
      estaCargando = true;
    });
    var response =
        await http.post("https://viveyupi.com/api/usuario/", headers: {
      'Authorization': 'JWT ' + tokenUsuario,
    });
    setState(() {
      estaCargando = false;
    });

    return response.body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(),
      body: ModalProgressHUD(
        inAsyncCall: estaCargando,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: usuario,
                decoration: InputDecoration(
                    hintText: "Usuario",
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25))),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: trabajo,
                decoration: InputDecoration(
                    hintText: "Trabajo",
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25))),
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                child: Text("Crear"),
                onPressed: () async {
                  String usr = await crearUsuario();
                  scaffoldKey.currentState.showSnackBar(
                    SnackBar(
                      content: Text(usr),
                    ),
                  );
                },
              ),
              RaisedButton(
                child: Text("Consultar"),
                onPressed: () async {
                  String usr = await consultarUsuario();
                  scaffoldKey.currentState.showSnackBar(
                    SnackBar(
                      content: Text(usr),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
