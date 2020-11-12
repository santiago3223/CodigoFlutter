import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController correoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  ingresar() async {}

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
