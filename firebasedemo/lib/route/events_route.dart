import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasedemo/models/event.dart';
import 'package:firebasedemo/models/favourite.dart';
import 'package:firebasedemo/route/signup_route.dart';
import 'package:firebasedemo/utils/authentication.dart';
import 'package:firebasedemo/utils/firestore_helper.dart';
import 'package:flutter/material.dart';

class EventsRoute extends StatefulWidget {
  @override
  _EventsRouteState createState() => _EventsRouteState();
}

class _EventsRouteState extends State<EventsRoute> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  List<Event> eventos = [];
  List<Favourite> favoritos = [];

  Future<List<Event>> getEvents() async {
    var data = await db.collection('event_details').get();
    var respuesta = [];
    if (data != null) {
      data.docs.forEach((element) {
        print(element["description"]);
      });
      respuesta = data.docs.map((e) => Event.fromMap(e)).toList();
    }
    return respuesta;
  }

  Future getFavourites(){
    FirestoreHelper().getUserFavourites(Authentication().getUser().uid).then((value) => setState(() {
                              favoritos = value;
                            }));
                            
  }

  bool isFavourite(String eventId) {
    Favourite favourite = favoritos.firstWhere(
        (element) => element.eventId == eventId,
        orElse: () => null);
    if (favourite != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    getEvents().then((value) {
      setState(() {
        eventos = value;
      });
    });
    FirestoreHelper()
        .getUserFavourites(Authentication().getUser().uid)
        .then((value) {
      setState(() {
        favoritos = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Eventos"),
        actions: [
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                Authentication().signOut().then((value) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SingUpRoute(),
                      ));
                });
              })
        ],
      ),
      body: ListView.builder(
        itemCount: eventos.length,
        itemBuilder: (context, index) {
          Color starColor =
              isFavourite(eventos[index].id) ? Colors.yellow : Colors.grey;
          return ListTile(
            title: Text(eventos[index].description),
            trailing: IconButton(
              icon: Icon(
                Icons.star,
                color: starColor,
              ),
              onPressed: () {
                if (isFavourite(eventos[index].id)) {
                  Favourite favourite = favoritos.firstWhere(
                      (element) => element.eventId == eventos[index].id);
                  FirestoreHelper().deleteFavourite(favourite.id).then((value) {
                     getFavourites();
                  });
                } else {
                  FirestoreHelper()
                      .addFavourite(
                          eventos[index].id, Authentication().getUser().uid)
                      .then((value) => getFavourites());
              },
            ),
          );
        },
      ),
    );
  }
}
