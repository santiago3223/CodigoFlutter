import 'package:contador/texto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: WidgetsPrueba());
  }
}

class WidgetsPrueba extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 500,
          width: 300,
          child: Column(
            children: [
              FlatButton(
                child: Text("flat"),
                highlightColor: Colors.blue,
                onPressed: () => {},
              ),
              RaisedButton(
                child: Text("raised"),
                highlightColor: Colors.blue,
                onPressed: () => {},
              ),
              OutlineButton(
                child: Text("raised"),
                onPressed: () => {},
              ),
              CupertinoButton(
                child: Text("cupertino"),
                onPressed: () => {},
              ),
              IconButton(
                icon: Icon(FontAwesomeIcons.addressCard),
                tooltip: "IconButton",
                onPressed: () => {},
              ),
              RaisedButton.icon(
                onPressed: () => {},
                icon: Icon(Icons.ac_unit),
                label: Text("Raised icon"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyPage extends StatelessWidget {
  void contactanos(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("contactanos"),
          content: Text("contacto codigo"),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hola CodiGo"),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Hola Santiago",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "A programar",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            Image.network(
              'https://images.freeimages.com/images/large-previews/eaa/the-beach-1464354.jpg',
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                child: Text("presioname"),
                onPressed: () => contactanos(context),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
