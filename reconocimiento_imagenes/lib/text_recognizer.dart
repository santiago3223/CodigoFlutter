import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';

class ReconocedorTexto extends StatefulWidget {
  File file;

  ReconocedorTexto(this.file);

  @override
  _ReconocedorTextoState createState() => _ReconocedorTextoState();
}

class _ReconocedorTextoState extends State<ReconocedorTexto> {
  VisionText text;
  void reconocerTexto() async {
    FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(widget.file);
    TextRecognizer imageLabeler = FirebaseVision.instance.textRecognizer();
    VisionText detectedText = await imageLabeler.processImage(visionImage);

    print(detectedText.text);
    setState(() {
      text = detectedText;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    reconocerTexto();
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
            child: (text == null)
                ? Container()
                : ListView.builder(
                    itemCount: text.blocks.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(
                        text.blocks[index].text,
                      ),
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
