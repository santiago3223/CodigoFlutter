import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasedemo/models/event.dart';
import 'package:flutter/material.dart';

class EventsRoute extends StatefulWidget {
  @override
  _EventsRouteState createState() => _EventsRouteState();
}

class _EventsRouteState extends State<EventsRoute> {
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<List<Event>> getEvents() async {
    var data = await db.collection('event_details').get();
    data.docs.forEach((element) {
      print(element["description"]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Eventos"),
      ),
    );
  }
}
