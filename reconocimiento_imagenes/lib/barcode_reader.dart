import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BarcodeReader extends StatefulWidget {
  File file;

  BarcodeReader(this.file);
  @override
  _BarcodeReaderState createState() => _BarcodeReaderState();
}

class _BarcodeReaderState extends State<BarcodeReader> {
  List<Barcode> codigos;

  void escanearQR() async {
    FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(widget.file);
    BarcodeDetector imageLabeler = FirebaseVision.instance.barcodeDetector();
    List<Barcode> detectedLabels =
        await imageLabeler.detectInImage(visionImage);

    setState(() {
      codigos = detectedLabels;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    escanearQR();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lector de QR"),
      ),
      body: Column(
        children: [
          Expanded(child: Image.file(widget.file)),
          Expanded(
              child: ListView.builder(
            itemCount: codigos.length,
            itemBuilder: (context, index) {
              print(codigos[index].valueType);
              switch (codigos[index].valueType) {
                case BarcodeValueType.contactInfo:
                  return ListTile(
                    title: Text(codigos[index].contactInfo.name.formattedName),
                    subtitle: Text(codigos[index]
                        .contactInfo
                        .phones
                        .first
                        .number
                        .toString()),
                  );
                  break;
                case BarcodeValueType.unknown:
                  // TODO: Handle this case.
                  break;
                case BarcodeValueType.email:
                  return ListTile(
                    title: Text(codigos[index].email.address),
                    subtitle: Text(codigos[index].email.subject),
                  );
                  break;
                case BarcodeValueType.isbn:
                  // TODO: Handle this case.
                  break;
                case BarcodeValueType.phone:
                  return ListTile(
                    title: Text(codigos[index].phone.number),
                    trailing: IconButton(
                        icon: Icon(Icons.phone),
                        onPressed: () {
                          launch("sms:" + codigos[index].phone.number);
                        }),
                  );
                  break;
                case BarcodeValueType.product:
                  // TODO: Handle this case.
                  break;
                case BarcodeValueType.sms:
                  // TODO: Handle this case.
                  break;
                case BarcodeValueType.text:
                  return ListTile(
                    title: Text(codigos[index].rawValue),
                  );
                  break;
                case BarcodeValueType.url:
                  // TODO: Handle this case.
                  break;
                case BarcodeValueType.wifi:
                  // TODO: Handle this case.
                  break;
                case BarcodeValueType.geographicCoordinates:
                  // TODO: Handle this case.
                  break;
                case BarcodeValueType.calendarEvent:
                  // TODO: Handle this case.
                  break;
                case BarcodeValueType.driverLicense:
                  // TODO: Handle this case.
                  break;
              }
              return ListTile();
            },
          )),
        ],
      ),
    );
  }
}
