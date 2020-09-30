import 'package:flutter/material.dart';

class DemoCamara extends StatefulWidget {
  @override
  _DemoCamaraState createState() => _DemoCamaraState();
}

class _DemoCamaraState extends State<DemoCamara> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () {
                _displayPickImageDialog(context);
              },
              child: Icon(Icons.camera_alt),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _displayPickImageDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('seleccione'),
            actions: <Widget>[
              FlatButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(child: const Text('CAMARA'), onPressed: () {}),
              FlatButton(child: const Text('GALERIA'), onPressed: () {}),
            ],
          );
        });
  }
}
