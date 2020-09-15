import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetUser extends StatefulWidget {
  @override
  _GetUserState createState() => _GetUserState();
}

class _GetUserState extends State<GetUser> {
  Future<Map> getUser() async {
    var response = await http.get("https://reqres.in/api/users/23");

    if (response.statusCode == 200) {
      var res = jsonDecode(response.body)["data"];
      print(response.statusCode);
      return res;
    } else {
      throw Exception();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: FutureBuilder(
          future: getUser(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data["first_name"]);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Text("cargando");
          },
        ),
      ),
    );
  }
}
