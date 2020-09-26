import 'package:flutter/material.dart';
import 'package:miloficios_app/utils/http_helper.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController controllerUsuario = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  void iniciarSesion() async {
    String token = await HttpHelper()
        .iniciarSesion(controllerUsuario.text, controllerPassword.text);
    //controllerUsuario.clear();
    //controllerPassword.clear();
    print(token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://st2.depositphotos.com/1752173/12158/v/950/depositphotos_121587406-stock-illustration-seamless-pattern-construction-tools-vector.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      )
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Mil Oficios",
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextField(
                        controller: controllerUsuario,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.account_circle),
                          hintText: "Usuario",
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                BorderSide(color: Colors.yellow, width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextField(
                        controller: controllerPassword,
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          hintText: "Password",
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                BorderSide(color: Colors.yellow, width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      RaisedButton(
                        color: Colors.blue,
                        onPressed: () {
                          iniciarSesion();
                        },
                        child: Text(
                          "Iniciar Sesión",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
