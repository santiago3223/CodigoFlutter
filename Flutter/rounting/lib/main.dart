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
      onGenerateRoute: (settings) {
        if (settings.name == '/pagina2') {
          return MaterialPageRoute<UserDetails>(builder: (context) {
            {
              return SegundaPagina(settings.arguments);
            }
          });
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
              onPressed: () async {
                UserDetails resultado = await Navigator.pushNamed(
                    context, "/pagina2",
                    arguments: _userDetails);
                if (resultado != null) {
                  setState(() {
                    _userDetails = resultado;
                  });
                }
              },
              child: Text("Ir a segunda Página"),
            ),
          ],
        ),
      ),
    );
  }
}
