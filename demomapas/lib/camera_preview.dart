import 'dart:io';

import 'package:demomapas/dbHelper.dart';
import 'package:flutter/material.dart';

import 'place.dart';

class ImagePreview extends StatelessWidget {
  Place place;
  final String imagePath;

  ImagePreview(this.imagePath, this.place);

  @override
  Widget build(BuildContext context) {
    DbHelper helper = DbHelper();
    return Scaffold(
      appBar: AppBar(
        title: Text("Preview"),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () async {
                place.image = imagePath;
                await helper.insertPlace(place);
                Navigator.popUntil(context, (route) => route.isFirst);
              })
        ],
      ),
      body: Container(
        child: Center(child: Image.file(File(imagePath))),
      ),
    );
  }
}
