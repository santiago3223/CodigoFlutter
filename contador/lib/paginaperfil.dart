import 'package:flutter/material.dart';

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
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildHeader(context),
                buildHeaderComidas(context),
                buildListaComidas(context),
                buildHeaderPosts(context),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(
                            "https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/food%2Fmeal.jpg?alt=media",
                            fit: BoxFit.fill),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Food joint",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container buildHeaderPosts(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Most Liked posts",
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView buildListaComidas(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              width: 150,
              height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                          "https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/food%2Fmeal.jpg?alt=media",
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Food joint",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              width: 150,
              height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                          "https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/food%2Fmeal.jpg?alt=media",
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Food joint",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              width: 150,
              height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                          "https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/food%2Fmeal.jpg?alt=media",
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Food joint",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildHeaderComidas(BuildContext context) {
    return Container(
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
