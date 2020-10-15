import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasedemo/utils/authentication.dart';
import 'package:flutter/material.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

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
  TextEditingController smsCode = TextEditingController();
  bool isLogIn = true;
  RemoteConfig remoteConfig;
  String remoteColor = "0xFFFFFF";

  obtenerColor() async {
    remoteConfig = await RemoteConfig.instance;
    var defaults = <String, dynamic>{'color': "0xFF4286f4"};
    remoteConfig.setDefaults(defaults);
    await remoteConfig.fetch(expiration: const Duration(seconds: 10));
    await remoteConfig.activateFetched();
    String color = remoteConfig.getString("color");
    print(color);
    setState(() {
      remoteColor = color;
    });
  }

  @override
  void initState() {
    super.initState();
    obtenerColor();
  }

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
        firebaseAuth.signInWithCredential(phoneAuthCredential).then((_) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => EventsRoute(),
              ));
        });
      },
      verificationFailed: (error) {
        print(error.toString());
      },
      codeSent: (verificationId, forceResendingToken) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Ingrese el codigo"),
            content: TextField(
              controller: smsCode,
            ),
            actions: [
              FlatButton(
                  onPressed: () {
                    var credencial = PhoneAuthProvider.credential(
                        verificationId: verificationId, smsCode: smsCode.text);
                    firebaseAuth.signInWithCredential(credencial).then((value) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EventsRoute(),
                          ));
                    });
                  },
                  child: Text("Verificar"))
            ],
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
        backgroundColor: Color(int.parse(remoteColor)),
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
