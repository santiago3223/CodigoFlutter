import 'package:flutter/material.dart';
import 'package:rounting/segundapagina.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: PrimeraPagina(),
      routes: {
        '/pagina2': (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text("pagina2"),
            ),
            body: Column(
              children: [
                TextField(),
                Container(
                  height: 200,
                  width: 200,
                  color: Colors.greenAccent,
                ),
              ],
            ),
          );
        }
      },
    );
  }
}

class UserDetails {
  String nombre;
  String apellido;
  UserDetails(this.nombre, this.apellido);
}

class PrimeraPagina extends StatefulWidget {
  @override
  _PrimeraPaginaState createState() => _PrimeraPaginaState();
}

class _PrimeraPaginaState extends State<PrimeraPagina> {
  UserDetails _userDetails = UserDetails("Frank", "Cornejo");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Primera Página"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Nombre: ${_userDetails.nombre}"),
            Text("Nombre: ${_userDetails.apellido}"),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SegundaPagina(_userDetails);
                    },
                  ),
                );
              },
              child: Text("Ir a segunda Página"),
            ),
          ],
        ),
      ),
    );
  }
}
