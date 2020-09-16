import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud/modal_progress_hud.dart';

class PutUser extends StatefulWidget {
  @override
  _PutUserState createState() => _PutUserState();
}

class _PutUserState extends State<PutUser> {
  TextEditingController usuario = TextEditingController();
  TextEditingController trabajo = TextEditingController();
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();
  bool estaCargando = false;

  Future<String> crearUsuario() async {
    setState(() {
      estaCargando = true;
    });
    var response = await http.patch("https://reqres.in/api/users",
        body: {"name": usuario.text, "job": trabajo.text});
    print(response.statusCode);
    print(response.body.toString());
    setState(() {
      estaCargando = false;
    });
    return response.body.toString();
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
