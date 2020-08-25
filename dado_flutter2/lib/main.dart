import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PaginaDado(),
    );
  }
}

class PaginaDado extends StatefulWidget {
  @override
  _PaginaDadoState createState() => _PaginaDadoState();
}

class _PaginaDadoState extends State<PaginaDado> {
  List<int> _numerosDados = [1];
  int _cantidadDados = 1;

  void _refrescarDados() {
    for (int i = 0; i < _numerosDados.length; i++) {
      _numerosDados[i] = 1 + Random().nextInt(6);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("dado"),
      ),
      body: Container(
        color: Colors.red,
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        if (_cantidadDados > 1) {
                          _cantidadDados--;
                          _numerosDados.removeLast();
                          _refrescarDados();
                        }
                      });
                    },
                    child: Text("Quitar"),
                  ),
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        _cantidadDados++;
                        _numerosDados.add(1);
                        _refrescarDados();
                      });
                    },
                    child: Text("Agregar"),
                  )
                ],
              ),
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      _refrescarDados();
                    });
                  },
                  child: GridView.builder(
                    itemCount: _cantidadDados,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 150),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image(
                          image: AssetImage(
                              "assets/images/dice${_numerosDados[index]}.png"),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
