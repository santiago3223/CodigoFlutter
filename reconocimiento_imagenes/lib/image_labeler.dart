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
  List<ImageLabel> labels = [];

  void etiquetarImagen() async {
    FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(widget.file);
    ImageLabeler imageLabeler = FirebaseVision.instance.imageLabeler();
    List<ImageLabel> detectedLabels =
        await imageLabeler.processImage(visionImage);

    for (ImageLabel f in detectedLabels) {
      print(f.text);
    }

    setState(() {
      labels = detectedLabels;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    etiquetarImagen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Etiquetador de imagenes"),
      ),
      body: Column(
        children: [
          Expanded(child: Image.file(widget.file)),
          Expanded(
            child: ListView.builder(
              itemCount: labels.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(
                  labels[index].text,
                ),
                trailing: Text(labels[index].confidence.toString()),
              ),
            ),
          )
        ],
      ),
    );
  }
}
