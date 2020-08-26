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
  GlobalKey<FormState> _formKey = GlobalKey();
  List<ItemLista> items = [];
  String item = "";
  int cantidad = 0;

  String _validarItemVacio(String value) =>
      value.isEmpty ? 'Campo requerido' : null;

  String _validarMayorqueCero(String value) {
    int valor = value.isEmpty ? 0 : int.parse(value);
    return valor == 0 ? 'Se requiere al menos 1 unidad' : null;
  }

  void _verificarYAgregarOrden() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      ItemLista i = ItemLista(item: item, cantidad: cantidad);
      setState(() {
        items.insert(0, i);
      });
      _formKey.currentState.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de compras"),
      ),
      body: Column(
        children: [
          Form(
            key: _formKey,
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
          ),
          Expanded(
            child: Container(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    background: Container(color: Colors.red),
                    key: Key(items[index].item),
                    onDismissed: (dir) {
                      setState(() {
                        items.removeAt(index);
                      });
                    },
                    child: ListTile(
                      title: Text(items[index].item),
                      subtitle: Text(items[index].cantidad.toString()),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ItemLista {
  String item;
  int cantidad;

  ItemLista({this.item, this.cantidad});
}
