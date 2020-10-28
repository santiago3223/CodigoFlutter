import 'package:demomapas/dbHelper.dart';
import 'package:demomapas/place.dart';
import 'package:flutter/material.dart';

class ManagePlaces extends StatefulWidget {
  @override
  _ManagePlacesState createState() => _ManagePlacesState();
}

class _ManagePlacesState extends State<ManagePlaces> {
  List<Place> places = [];
  DbHelper dbHelper = DbHelper();

  Future _getData() async {
    await dbHelper.openDb();
    places = await dbHelper.getPlaces();
    setState(() {
      places = places;
    });
  }

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Places"),
      ),
      body: ListView.builder(
        itemCount: places.length,
        itemBuilder: (context, index) => Dismissible(
          key: Key(places[index].id.toString()),
          child: ListTile(
            title: Text(places[index].name),
          ),
        ),
      ),
    );
  }
}
