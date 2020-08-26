import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListaCompras(),
    );
  }
}

class ListaCompras extends StatefulWidget {
  @override
  _ListaComprasState createState() => _ListaComprasState();
}

class _ListaComprasState extends State<ListaCompras> {
  String item = "";
  int cantidad = 0;

  String _validarItemVacio(String value) =>
      value.isEmpty ? 'Campo requerido' : null;

  String _validarMayorqueCero(String value) {
    int valor = value.isEmpty ? 0 : int.parse(value);
    return valor == 0 ? 'Se requiere al menos 1 unidad' : null;
  }

  void _verificarYAgregarOrden() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de compras"),
      ),
      body: Column(
        children: [
          Form(
            child: Column(
              children: [
                TextFormField(
                  validator: _validarItemVacio,
                  decoration: InputDecoration(labelText: "Item"),
                  onSaved: (newValue) => item = newValue,
                ),
                TextFormField(
                  validator: _validarMayorqueCero,
                  decoration: InputDecoration(labelText: "Cantidad"),
                  onSaved: (newValue) => cantidad = int.parse(newValue),
                ),
                RaisedButton(onPressed: _verificarYAgregarOrden)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ItemLista {
  String item;
  int cantidad;
}
