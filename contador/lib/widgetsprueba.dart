import 'package:flutter/material.dart';

class WidgetsPrueba extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 300,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              children: [
                Card(
                  elevation: 5,
                  color: Colors.red,
                  shadowColor: Colors.blue,
                  child: Container(
                    width: 100,
                    child: Text("Codigo"),
                  ),
                ),
                Text("hola codigo"),
                Container(
                  width: 100,
                  color: Colors.black,
                ),
              ],
            ),
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
