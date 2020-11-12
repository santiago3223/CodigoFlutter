import 'package:dio/dio.dart';
import 'package:dioAPI/models/cliente.dart';
import 'package:dioAPI/models/user.dart';
import 'package:flutter/material.dart';

import '../rest_api.dart';

class RegisterView extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController dniController = TextEditingController();
  TextEditingController celularController = TextEditingController();
  TextEditingController ciudadController = TextEditingController();
  TextEditingController correoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  registrarUsuario() async {
    var user = User(
        username: correoController.text,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: correoController.text,
        password: passwordController.text,
        isActive: true);

    var cliente = Cliente(
        user: user,
        pais: "Peru",
        departamento: ciudadController.text,
        dni: dniController.text,
        telefono: celularController.text);

    var dio = Dio();
    var client = CodigoApi(dio);
    client
        .registrarCliente(cliente)
        .then((value) => print(value))
        .catchError((obj) {
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
                  controller: firstNameController,
                  decoration: InputDecoration(hintText: "Nombre"),
                ),
                TextFormField(
                  controller: lastNameController,
                  decoration: InputDecoration(hintText: "Apellidos"),
                ),
                TextFormField(
                  controller: dniController,
                  decoration: InputDecoration(hintText: "DNI"),
                ),
                TextFormField(
                  controller: celularController,
                  decoration: InputDecoration(hintText: "Celular"),
                ),
                TextFormField(
                  controller: ciudadController,
                  decoration: InputDecoration(hintText: "Ciudad"),
                ),
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
                    registrarUsuario();
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
