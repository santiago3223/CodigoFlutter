import 'package:demomapas/dbHelper.dart';
import 'package:demomapas/place.dart';
import 'package:demomapas/place_dialog.dart';
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
          background: Container(
            color: Colors.green,
          ),
          secondaryBackground: Container(
            color: Colors.red,
          ),
          onDismissed: (direction) {
            dbHelper.deletePlace(places[index]);
            setState(() {
              places.removeAt(index);
            });
          },
          key: Key(places[index].id.toString()),
          child: ListTile(
            title: Text(places[index].name),
            trailing: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () async {
                PlaceDialog dialog = PlaceDialog(places[index], false);
                await showDialog(
                  context: context,
                  builder: (context) => dialog.buildAlert(context),
                );
                _getData();
              },
            ),
          ),
        ),
      ),
    );
  }
}
