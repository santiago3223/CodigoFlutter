import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget appBarCodigo(BuildContext context) {
  return AppBar(
    title: Text("Codigo Chat"),
    elevation: 0.0,
  );
}

InputDecoration textFieldInputDecoration(String hint) {
  return InputDecoration(
    hintText: hint,
    hintStyle: TextStyle(color: Colors.white54),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
  );
}
