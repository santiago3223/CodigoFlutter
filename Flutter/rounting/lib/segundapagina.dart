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

  GlobalKey<FormFieldState<String>> keyNombre = GlobalKey();
  GlobalKey<FormFieldState<String>> keyApellido = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Segunda pagina"),
      ),
      body: Column(
        children: [
          TextFormField(
            key: keyNombre,
            initialValue: _userDetails.nombre,
          ),
          TextFormField(
            key: keyApellido,
            initialValue: _userDetails.apellido,
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pop(
                  context,
                  UserDetails(keyNombre.currentState.value,
                      keyApellido.currentState.value));
            },
            child: Text("editar"),
          )
        ],
      ),
    );
  }
}
