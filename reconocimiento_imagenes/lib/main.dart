import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reconocimiento_imagenes/detalle.dart';

import 'barcode_reader.dart';
import 'image_labeler.dart';
import 'text_recognizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reconocedor de imagenes"),
      ),
      body: Column(
        children: [
          Center(
            child: Text("Seleccione una imagen"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                onPressed: () async {
                  var pickedfile =
                      await picker.getImage(source: ImageSource.camera);
                  File file = File(pickedfile.path);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BarcodeReader(file),
                      ));
                },
                child: Text("Camara"),
              ),
              RaisedButton(
                onPressed: () async {
                  var pickedfile =
                      await picker.getImage(source: ImageSource.gallery);
                  File file = File(pickedfile.path);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BarcodeReader(file),
                      ));
                },
                child: Text("Galleria"),
              )
            ],
          )
        ],
      ),
    );
  }
}
