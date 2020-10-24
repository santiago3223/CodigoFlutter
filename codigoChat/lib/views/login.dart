import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codigoChat/services/auth.dart';
import 'package:codigoChat/services/database.dart';
import 'package:codigoChat/utils/preferencias.dart';
import 'package:codigoChat/views/chats.dart';
import 'package:codigoChat/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class LogIn extends StatefulWidget {
  Function cambiarVista;

  LogIn(this.cambiarVista);
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AuthService authService = AuthService();
  FirestoreHelper firestoreHelper = FirestoreHelper();

  logInFacebook() async {
    final facebookLogin = FacebookLogin();
    final result = await facebookLogin.logIn(['email', 'public_profile']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        print(result.accessToken.token);
        break;
      case FacebookLoginStatus.cancelledByUser:
        print("El usuario cancelo");
        break;
      case FacebookLoginStatus.error:
        print(result.errorMessage);
        break;
    }
  }

  logIn() async {
    if (formKey.currentState.validate()) {
      authService
          .logIn(emailController.text, passwordController.text)
          .then((value) async {
        QuerySnapshot usr =
            await firestoreHelper.getUserInfo(emailController.text);

        Preferencias().saveEmail(emailController.text);
        await Preferencias().saveUserName(usr.docs[0]["userName"]);
        Preferencias().saveLogInState(true);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Chats(),
            ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCodigo(context),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Spacer(),
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(color: Colors.white),
                    controller: emailController,
                    decoration: textFieldInputDecoration("email"),
                    validator: (value) {
                      if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                        return "Ingrese un correo valido";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    obscureText: true,
                    controller: passwordController,
                    decoration: textFieldInputDecoration("password"),
                    validator: (value) {
                      if (value.isEmpty || value.length < 5) {
                        return "Ingrese un password de 6+ caracteres";
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            RaisedButton(
              onPressed: () {
                logIn();
              },
              child: Text("Inicia Sesión"),
            ),
            RaisedButton(
              onPressed: () {
                logInFacebook();
              },
              child: Text("Inicia Sesión con Facebook"),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Text(
                  "No tienes una cuenta?",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                GestureDetector(
                  onTap: widget.cambiarVista,
                  child: Text(
                    "Registrate ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
