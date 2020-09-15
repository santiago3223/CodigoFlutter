import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CreateUser extends StatefulWidget {
  @override
  _CreateUserState createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  TextEditingController usuario = TextEditingController();
  TextEditingController trabajo = TextEditingController();

  Future<String> crearUsuario() async {
    var response = await http.post("https://reqres.in/api/users",
        body: {"name": usuario.text, "job": trabajo.text});
    print(response.statusCode);
    print(response.body.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
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
              onPressed: () {
                crearUsuario();
              },
            )
          ],
        ),
      ),
    );
  }
}
