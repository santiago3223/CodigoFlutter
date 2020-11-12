import 'package:dio/dio.dart';
import 'package:dioAPI/views/empresas.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../rest_api.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController correoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  ingresar() async {
    var dio = Dio();
    var client = CodigoApi(dio);
    client
        .ingresarCliente(correoController.text, passwordController.text)
        .then((value) async {
      print(value.token);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("token", value.token);
      await prefs.setInt("id", value.userId);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EmpresasView(),
          ));
    }).catchError((obj) {
      _scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text(obj.response.toString())));
      print(obj.response);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Registro"),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  controller: correoController,
                  decoration: InputDecoration(hintText: "Correo"),
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(hintText: "Password"),
                ),
                RaisedButton(
                  onPressed: () {
                    ingresar();
                  },
                  child: Text("Registrar"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
