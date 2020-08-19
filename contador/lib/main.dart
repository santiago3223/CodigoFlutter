import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: PaginaPerfil());
  }
}

class PaginaPerfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.indigo.shade300, Colors.indigo.shade700])),
          ),
          Column(
            children: [
              buildHeader(context),
              Container(
                margin: EdgeInsets.only(top: 10),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Collection",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Text("Create new"),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Container buildHeader(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 70),
      height: 240,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 40),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 10,
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Santiago",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("Profesor | de | codigo"),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 40,
                    child: Row(
                      children: [
                        Expanded(
                          child: ListTile(
                            title: Text(
                              "32",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text("posts".toUpperCase(),
                                textAlign: TextAlign.center),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: Text(
                              "32",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text("posts".toUpperCase(),
                                textAlign: TextAlign.center),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: Text(
                              "32",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text("posts".toUpperCase(),
                                textAlign: TextAlign.center),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Material(
              elevation: 5,
              shape: CircleBorder(),
              child: CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                      "https://i.pinimg.com/originals/f9/2d/c2/f92dc2391ba065ae845068bf2301da4d.jpg")),
            ),
          ),
        ],
      ),
    );
  }
}
