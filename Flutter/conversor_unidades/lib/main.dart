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

  void convertir(double valor, String uInicial, String uConvertida) {
    resultado = "";
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
