import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Conversor de unidades"),
        ),
        body: BodyConversorUnidades(),
      ),
    );
  }
}

class BodyConversorUnidades extends StatefulWidget {
  @override
  _BodyConversorUnidadesState createState() => _BodyConversorUnidadesState();
}

class _BodyConversorUnidadesState extends State<BodyConversorUnidades> {
  double numeroInicial;
  String unidadInicial = "metros";
  String unidadConvertida = "metros";
  String resultado = "";
  List<String> unidades = [
    'metros',
    'kilometros',
    'gramos',
    'kilogramos',
    'pies',
    'millas',
    'libras',
    'onzas'
  ];

  List _formulas = [
    [1, 0.001, 0, 0, 3.28084, 0.000621371, 0, 0],
    [1000, 1, 0, 0, 3280.84, 0.621371, 0, 0],
    [0, 0, 1, 0.0001, 0, 0, 0.00220462, 0.035274],
    [0, 0, 1000, 1, 0, 0, 2.20462, 35.274],
    [0.3048, 0.0003048, 0, 0, 1, 0.000189394, 0, 0],
    [1609.34, 1.60934, 0, 0, 5280, 1, 0, 0],
    [0, 0, 453.592, 0.453592, 0, 0, 1, 16],
    [0, 0, 28.3495, 0.0283495, 3.28084, 0, 0.0625, 1],
  ];

  void convertir(double valor, String uInicial, String uConvertida) {
    double res = valor *
        _formulas[unidades.indexOf(uInicial)][unidades.indexOf(uConvertida)];
    if (res == 0) {
      resultado = "No se puede convertir esas unidades";
    } else {
      resultado = "$valor $uInicial equivale a $res $uConvertida";
    }
  }

  @override
  void initState() {
    numeroInicial = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Text("Ingrese valor:"),
            TextField(
              decoration: InputDecoration(
                  hintText: "Por favor ingrese el valor a ser convertido"),
              keyboardType: TextInputType.number,
              onChanged: (texto) {
                double numero = double.tryParse(texto);
                if (numero != null) {
                  setState(() {
                    numeroInicial = numero;
                  });
                }
              },
            ),
            Text("Convertir de:"),
            DropdownButton(
              value: unidadInicial,
              items: unidades
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ),
                  )
                  .toList(),
              onChanged: (unidad) {
                setState(() {
                  unidadInicial = unidad;
                });
              },
            ),
            Text("a:"),
            DropdownButton(
              value: unidadConvertida,
              items: unidades
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ),
                  )
                  .toList(),
              onChanged: (unidad) {
                setState(() {
                  unidadConvertida = unidad;
                });
              },
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  convertir(numeroInicial, unidadInicial, unidadConvertida);
                });
              },
              child: Text("Convertir"),
            ),
            Text(resultado)
          ],
        ),
      ),
    );
  }
}
