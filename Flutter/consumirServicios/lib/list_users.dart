import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ListUsers extends StatefulWidget {
  @override
  _ListUsersState createState() => _ListUsersState();
}

class _ListUsersState extends State<ListUsers> {
  Future<List> obtenerUsuarios() async {
    var respuesta = await http.get("https://reqres.in/api/users?page=2");
    var resp = convert.jsonDecode(respuesta.body)["data"];
    return resp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: FutureBuilder(
            future: obtenerUsuarios(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List listaPersonas = snapshot.data;
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    Map persona = listaPersonas[index];
                    return ListTile(
                      leading: Image.network(persona["avatar"]),
                      title: Text(persona["first_name"] + persona["last_name"]),
                      subtitle: Text(persona["email"]),
                    );
                  },
                );
              }
              return Text("espera");
            }),
      ),
    );
  }
}
