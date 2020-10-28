import 'package:camera/camera.dart';
import 'package:demomapas/camera_preview.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'place.dart';

class CameraScreen extends StatefulWidget {
  Place place;

  CameraScreen(this.place);
  @override
  _CameraScreenState createState() => _CameraScreenState(place);
}

class _CameraScreenState extends State<CameraScreen> {
  List<CameraDescription> cameras;
  CameraController _cameraController;
  CameraDescription camera;
  Widget cameraPreview;
  Place place;
  _CameraScreenState(this.place);

  Future setCamera() async {
    cameras = await availableCameras();
    if (cameras.length != 0) {
      camera = cameras.first;
    }
  }

  @override
  void initState() {
    setCamera().then((_) {
      _cameraController = CameraController(camera, ResolutionPreset.medium);
      _cameraController.initialize().then((value) {
        cameraPreview = Center(
          child: CameraPreview(_cameraController),
        );
        setState(() {
          cameraPreview = cameraPreview;
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Camara"),
        actions: [
          IconButton(
              icon: Icon(Icons.camera),
              onPressed: () async {
                String path = join((await getTemporaryDirectory()).path,
                    "${DateTime.now()}.png");
                await _cameraController.takePicture(path);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ImagePreview(path, place),
                    ));
              })
        ],
      ),
      body: Container(
        child: cameraPreview,
      ),
    );
  }
}
