import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasedemo/models/event.dart';
import 'package:flutter/material.dart';

class EventsRoute extends StatefulWidget {
  @override
  _EventsRouteState createState() => _EventsRouteState();
}

class _EventsRouteState extends State<EventsRoute> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  List<Event> eventos = [];

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

  @override
  void initState() {
    super.initState();
    getEvents().then((value) {
      setState(() {
        eventos = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Eventos")),
      body: ListView.builder(
        itemCount: eventos.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(eventos[index].description),
        ),
      ),
    );
  }
}
