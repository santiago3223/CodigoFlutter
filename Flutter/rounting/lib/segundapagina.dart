import 'package:flutter/material.dart';

import 'main.dart';

class SegundaPagina extends StatefulWidget {
  UserDetails userDetails;
  SegundaPagina(this.userDetails);

  @override
  _SegundaPaginaState createState() => _SegundaPaginaState(userDetails);
}

class _SegundaPaginaState extends State<SegundaPagina> {
  UserDetails _userDetails;
  _SegundaPaginaState(this._userDetails);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Segunda pagina"),
      ),
      body: Column(
        children: [
          TextFormField(
            initialValue: _userDetails.nombre,
          ),
          TextFormField(
            initialValue: _userDetails.apellido,
          ),
        ],
      ),
    );
  }
}
