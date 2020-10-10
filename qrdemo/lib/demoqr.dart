import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrDemo extends StatefulWidget {
  @override
  _QrDemoState createState() => _QrDemoState();
}

class _QrDemoState extends State<QrDemo> {
  GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController controller;

  void inicializarLectorQR(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      print("COdigo " + scanData.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: QRView(
              key: qrKey,
              onQRViewCreated: inicializarLectorQR,
              overlay: QrScannerOverlayShape(
                borderColor: Colors.red,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: 300,
              ),
            ),
          )
        ],
      ),
    );
  }
}
