import 'package:codigoChat/services/auth.dart';
import 'package:codigoChat/services/database.dart';
import 'package:codigoChat/views/chats.dart';
import 'package:codigoChat/widgets/widgets.dart';
import 'package:flutter/material.dart';

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

  logIn() async {
    if (formKey.currentState.validate()) {
      authService
          .logIn(emailController.text, passwordController.text)
          .then((value) {
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
              child: Text("Registrarse"),
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
