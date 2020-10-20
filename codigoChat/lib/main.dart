import 'package:codigoChat/widgets/widgets.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xff145C9E),
        scaffoldBackgroundColor: Color(0xff1F1F1F),
        accentColor: Color(0xff007EF4),
        fontFamily: "OverpassRegular",
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SignUp(),
    );
  }
}

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  signUp() {
    if (formKey.currentState.validate()) {
      print("registrar");
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
                    keyboardType: TextInputType.name,
                    style: TextStyle(color: Colors.white),
                    controller: usernameController,
                    decoration: textFieldInputDecoration("usuario"),
                    validator: (value) {
                      if (value.isEmpty || value.length < 5) {
                        return "Ingrese un nombre de usuario de 5+ caracteres";
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
                signUp();
              },
              child: Text("Registrarse"),
            ),
            Row(
              children: [Text("Ya tienes una cuenta?"), Text("Inicia sesión")],
            )
          ],
        ),
      ),
    );
  }
}
