import 'package:flutter/material.dart';

class WidgetCardAuto extends StatelessWidget {
  final String marca;
  const WidgetCardAuto({
    Key key,
    this.marca,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Column(
            children: [
              Text(marca),
              Text("Gol"),
              Image.network(
                  "https://acs2.blob.core.windows.net/imgcatalogo/m/VA_674e942d8f56473bafccf1184a89712c.jpg"),
            ],
          ),
        ),
      ),
    );
  }
}
