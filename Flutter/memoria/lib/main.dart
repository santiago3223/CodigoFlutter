import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Memoria(),
    );
  }
}

class Memoria extends StatefulWidget {
  @override
  _MemoriaState createState() => _MemoriaState();
}

class _MemoriaState extends State<Memoria> {
  List<String> datos = [];
  double cantMovimientos = 0;
  double puntaje = 0;
  String primerValor = "";
  String segundoValor = "";
  List<GlobalKey<FlipCardState>> cardKeys = [];

  void verificarTarjetas() {
    if (primerValor == segundoValor) {
      print("Gano");
    } else if (segundoValor != "") {
      print("Perdio");
      primerValor = "";
      segundoValor = "";
    }
  }

  void refrescarTarjetas() {
    double cantidad = 10;
    cardKeys = [
      for (double i = 1; i <= cantidad; i += 0.5) GlobalKey<FlipCardState>()
    ];
    datos = [for (double i = 1; i <= cantidad; i += 0.5) i.floor().toString()];
    datos.shuffle();
    voltearTarjetas();
  }

  void voltearTarjetas() {
    cardKeys.forEach((element) {
      if (element.currentState != null) element.currentState.toggleCard();
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text(cantMovimientos.floor().toString()),
            Expanded(
              child: GridView.builder(
                itemCount: datos.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) => FlipCard(
                  key: cardKeys[index],
                  onFlipDone: (isFront) {
                    setState(() {
                      if (primerValor == "") {
                        primerValor = datos[index];
                      } else {
                        segundoValor = datos[index];
                      }
                      verificarTarjetas();
                      cantMovimientos += 0.5;
                    });
                  },
                  front: Container(
                      margin: EdgeInsets.all(8), color: Colors.orange),
                  back: Container(
                    margin: EdgeInsets.all(8),
                    color: Colors.orange.shade200,
                    child: Center(child: Text(datos[index])),
                  ),
                ),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          setState(() {
            refrescarTarjetas();
          });
        }),
      ),
    );
  }
}
