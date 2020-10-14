import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasedemo/utils/authentication.dart';
import 'package:flutter/material.dart';

import 'events_route.dart';

class SingUpRoute extends StatefulWidget {
  @override
  _SingUpRouteState createState() => _SingUpRouteState();
}

class _SingUpRouteState extends State<SingUpRoute> {
  Authentication auth;
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPwd = TextEditingController();
  TextEditingController txtTelefono = TextEditingController();
  bool isLogIn = true;

  Future signUp() async {
    auth = Authentication();
    String userId = "";
    if (isLogIn) {
      userId = await auth.logIn(txtEmail.text, txtPwd.text);
    } else {
      userId = await auth.signUp(txtEmail.text, txtPwd.text);
    }

    if (userId.length > 0) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => EventsRoute(),
          ));
    }
  }

  Future<String> signUpPhone(String phone) async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (phoneAuthCredential) {
        firebaseAuth
            .signInWithCredential(phoneAuthCredential)
            .then((value) => print(value));
      },
      verificationFailed: (error) {
        print(error.toString());
      },
      codeSent: (verificationId, forceResendingToken) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Ingrese el codigo"),
            content: TextField(),
            actions: [FlatButton(onPressed: () {}, child: Text("Verificar"))],
          ),
        );
      },
      codeAutoRetrievalTimeout: (verificationId) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro"),
      ),
      body: Column(
        children: [
          TextField(
            controller: txtEmail,
            decoration:
                InputDecoration(hintText: "Correo", icon: Icon(Icons.mail)),
          ),
          TextField(
            controller: txtPwd,
            obscureText: true,
            decoration:
                InputDecoration(hintText: "Password", icon: Icon(Icons.lock)),
          ),
          RaisedButton(
            onPressed: () {
              signUp();
            },
            child: Text(isLogIn ? "INGRESAR" : "REGISTRATE"),
          ),
          FlatButton(
            onPressed: () {
              setState(() {
                isLogIn = !isLogIn;
              });
            },
            child: Text(!isLogIn ? "INGRESAR" : "REGISTRATE"),
          ),
          TextField(
            controller: txtTelefono,
            decoration:
                InputDecoration(hintText: "Telefono", icon: Icon(Icons.mail)),
          ),
          RaisedButton(
            onPressed: () {
              signUpPhone(txtTelefono.text);
            },
            child: Text("INGRESAR CON TELEFONO"),
          )
        ],
      ),
    );
  }
}
