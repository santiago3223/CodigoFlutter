import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DemoCamara extends StatefulWidget {
  @override
  _DemoCamaraState createState() => _DemoCamaraState();
}

class _DemoCamaraState extends State<DemoCamara> {
  final ImagePicker _picker = ImagePicker();
  PickedFile _imageFile;

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
              FlatButton(
                  child: const Text('CAMARA'),
                  onPressed: () async {
                    final pickedFile = await _picker.getImage(
                      source: ImageSource.camera,
                    );
                    setState(() {
                      _imageFile = pickedFile;
                    });
                  }),
              FlatButton(
                  child: const Text('GALERIA'),
                  onPressed: () async {
                    final pickedFile = await _picker.getImage(
                      source: ImageSource.gallery,
                    );
                    setState(() {
                      _imageFile = pickedFile;
                    });
                  }),
            ],
          );
        });
  }
}
