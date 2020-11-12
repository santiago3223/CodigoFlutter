import 'package:flutter/material.dart';

class EmpresasView extends StatefulWidget {
  @override
  _EmpresasViewState createState() => _EmpresasViewState();
}

class _EmpresasViewState extends State<EmpresasView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (Text("Empresas")),
      ),
    );
  }
}
