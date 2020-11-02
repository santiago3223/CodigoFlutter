import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
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
                  var file = await picker.getImage(source: ImageSource.camera);
                },
                child: Text("Camara"),
              ),
              RaisedButton(
                onPressed: () async {
                  var file = await picker.getImage(source: ImageSource.gallery);
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
