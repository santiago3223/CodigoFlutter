import 'package:codigoChat/views/login.dart';
import 'package:codigoChat/views/signup.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showLogIn = true;

  void cambiarVista() {
    setState(() {
      showLogIn = !showLogIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return showLogIn ? LogIn(cambiarVista) : SignUp(cambiarVista);
  }
}
