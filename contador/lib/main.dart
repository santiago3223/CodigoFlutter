import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: PaginaPerfil2());
  }
}

class PaginaPerfil2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
              gradient: LinearGradient(colors: [
                Colors.pink.shade400,
                Colors.orange.shade300,
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            height: 350,
          ),
          Container(
            margin: EdgeInsets.only(top: 80),
            child: Column(
              children: [
                Text(
                  "Date mate",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontStyle: FontStyle.italic),
                ),
                Container(
                  height: 230,
                  margin: EdgeInsets.only(left: 30, right: 30, top: 30),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.network(
                        "https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/food%2Fmeal.jpg?alt=media",
                        fit: BoxFit.cover),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
