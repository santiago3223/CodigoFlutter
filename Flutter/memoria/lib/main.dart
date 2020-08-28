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
  List<Tarjeta> tarjetas = [];
  int cantidadTarjetas = 10;
  double cantMovimientos = 0;
  double puntaje = 0;
  String primerValor = "";
  String segundoValor = "";

  void verificarTarjetas() {
    if (primerValor == segundoValor) {
      tarjetas
          .firstWhere((element) => element.dato == primerValor)
          .puedeVoltearse = false;
      tarjetas
          .lastWhere((element) => element.dato == primerValor)
          .puedeVoltearse = false;
      primerValor = "";
      segundoValor = "";
    } else if (segundoValor != "") {
      primerValor = "";
      segundoValor = "";
      voltearTarjetas();
    }
  }

  void refrescarTarjetas() {
    tarjetas = [
      for (double i = 1; i <= cantidadTarjetas; i += 1)
        Tarjeta((i / 2).floor().toString())
    ];
    tarjetas.shuffle();
    primerValor = "";
    segundoValor = "";
    voltearTarjetas();
  }

  void voltearTarjetas() {
    tarjetas.forEach((element) {
      element.voltearTarjeta();
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
            TextField(
              decoration: InputDecoration(hintText: "Cantidad de tarjetas"),
              onChanged: (value) {
                setState(() {
                  cantidadTarjetas = int.tryParse(value);
                });
              },
            ),
            Text(cantMovimientos.floor().toString()),
            Expanded(
              child: GridView.builder(
                itemCount: tarjetas.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) => FlipCard(
                  key: tarjetas[index].key,
                  onFlipDone: (isFront) {
                    setState(() {
                      if (primerValor == "") {
                        primerValor = tarjetas[index].dato;
                      } else {
                        segundoValor = tarjetas[index].dato;
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
                    child: Center(child: Text(tarjetas[index].dato)),
                  ),
                ),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                refrescarTarjetas();
              });
            }),
      ),
    );
  }
}

class Tarjeta {
  GlobalKey<FlipCardState> key;
  String dato;
  bool puedeVoltearse;

  Tarjeta(String dato) {
    this.dato = dato;
    puedeVoltearse = true;
    key = GlobalKey<FlipCardState>();
  }

  void voltearTarjeta() {
    if (puedeVoltearse &&
        key.currentState != null &&
        !key.currentState.isFront) {
      key.currentState.toggleCard();
    }
  }
}
