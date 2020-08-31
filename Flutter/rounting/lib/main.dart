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

class PrimeraPagina extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Primera Página"),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/pagina2");
              },
              child: Text("Ir a segunda Página"),
            ),
          ],
        ),
      ),
    );
  }
}
