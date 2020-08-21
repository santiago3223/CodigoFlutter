import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PaginaPerfil2 extends StatelessWidget {
  final List<String> nombres = [
    "Santiago",
    "Luis",
    "LITTMAN",
    "Jackson",
    "Gino",
    "Gerson",
    "Daniel"
  ];

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
                Stack(
                  children: [
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
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                                color: Colors.yellow,
                                borderRadius: BorderRadius.circular(15)),
                            child: Text("3.7km away")),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Sasha - 22",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 16,
                      color: Colors.grey,
                    ),
                    Text(
                      "San Diego California, USA",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(FontAwesomeIcons.instagram, color: Colors.grey),
                    SizedBox(width: 25),
                    Icon(FontAwesomeIcons.facebookF, color: Colors.grey),
                    SizedBox(width: 25),
                    Icon(FontAwesomeIcons.twitter, color: Colors.grey)
                  ],
                ),
                Container(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: nombres.length,
                    itemBuilder: (c, i) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 200,
                          child: Card(
                              child: Column(children: [
                            Image.network(
                                "https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/food%2Fmeal.jpg?alt=media"),
                            Text(nombres[i])
                          ])),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
