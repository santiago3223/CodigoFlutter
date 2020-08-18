import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotonesDemo extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Container(
      height: 500,
      width: 300,
      child: Column(
        children: [
          FlatButton(
            child: Text("flat"),
            highlightColor: Colors.blue,
            onPressed: () => {},
          ),
          RaisedButton(
            child: Text("raised"),
            highlightColor: Colors.blue,
            onPressed: () => {},
          ),
          OutlineButton(
            child: Text("raised"),
            onPressed: () => {},
          ),
          CupertinoButton(
            child: Text("cupertino"),
            onPressed: () => {},
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.addressCard),
            iconSize: 100,
            tooltip: "IconButton",
            onPressed: () => {},
          ),
          RaisedButton.icon(
            onPressed: () => {},
            icon: Icon(Icons.ac_unit),
            label: Text("Raised icon"),
          )
        ],
      ),
    );
  }
}
