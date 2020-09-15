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
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (c, i) => ListTile(
                          leading: Image.network(snapshot.data[i]["avatar"]),
                          title: Text(snapshot.data[i]["first_name"] +
                              snapshot.data[i]["last_name"]),
                          subtitle: Text(snapshot.data[i]["email"]),
                        ));
              }
              return Text("espera");
            }),
      ),
    );
  }
}
