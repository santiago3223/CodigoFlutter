import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';

class EtiquetadorImagenes extends StatefulWidget {
  File file;

  EtiquetadorImagenes(this.file);

  @override
  _EtiquetadorImagenesState createState() => _EtiquetadorImagenesState();
}

class _EtiquetadorImagenesState extends State<EtiquetadorImagenes> {
  void etiquetarImagen() async {
    FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(widget.file);
    ImageLabeler imageLabeler = FirebaseVision.instance.imageLabeler();
    List<ImageLabel> detectedLabels =
        await imageLabeler.processImage(visionImage);

    for (ImageLabel f in detectedLabels) {
      print(f.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    etiquetarImagen();
    return Scaffold(
      appBar: AppBar(
        title: Text("Etiquetador de imagenes"),
      ),
      body: Column(
        children: [Expanded(child: Image.file(widget.file))],
      ),
    );
  }
}
