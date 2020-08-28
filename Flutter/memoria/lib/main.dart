import 'dart:async';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

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
  Timer timer;
  int tiempo = 0;
  List<Tarjeta> tarjetas = [];
  int cantidadTarjetas = 10;
  double cantMovimientos = 0;
  double puntaje = 0;
  int primerValor = -1;
  int segundoValor = -1;
  List<String> imagenesCards = [
    "https://img.icons8.com/bubbles/2x/jake.png",
    "https://img.icons8.com/bubbles/2x/futurama-bender.png",
    "https://img.icons8.com/bubbles/2x/super-mario.png",
    "https://img.icons8.com/bubbles/2x/iron-man.png",
    "https://img.icons8.com/bubbles/2x/walter-white.png",
    "https://img.icons8.com/bubbles/2x/stormtrooper.png"
  ];

  void iniciarTimer() {
    tiempo = 0;
    if (timer != null) timer.cancel();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        tiempo = timer.tick;
      });
    });
  }

  void verificarTarjetas() {
    if (primerValor != segundoValor &&
        tarjetas[primerValor].dato == tarjetas[segundoValor].dato) {
      tarjetas[primerValor].puedeVoltearse = false;
      tarjetas[segundoValor].puedeVoltearse = false;
      primerValor = -1;
      segundoValor = -1;
    } else if (segundoValor != -1) {
      primerValor = -1;
      segundoValor = -1;
      voltearTarjetas();
    }

    if (tarjetas.every((element) => !element.puedeVoltearse)) {
      Toast.show("Ganamos", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      timer.cancel();
    }
  }

  void refrescarTarjetas() {
    if (cantidadTarjetas % 2 == 0) {
      tarjetas = [
        for (double i = 0; i < cantidadTarjetas; i += 1)
          Tarjeta(imagenesCards[(i / 2).floor() % imagenesCards.length])
      ];
      tarjetas.shuffle();
      primerValor = -1;
      segundoValor = -1;
      cantMovimientos = 0;
      voltearTarjetas();
      iniciarTimer();
    } else {
      Toast.show("Ingrese un numero de tarjetas par", context);
    }
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
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text("Memoria Codigo"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(hintText: "Cantidad de tarjetas"),
                onChanged: (value) {
                  setState(() {
                    cantidadTarjetas = int.tryParse(value);
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(tiempo.toString()),
                  Text(cantMovimientos.floor().toString()),
                ],
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: tarjetas.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) => FlipCard(
                    flipOnTouch: tarjetas[index].puedeVoltearse,
                    key: tarjetas[index].key,
                    onFlipDone: (isFront) {
                      setState(() {
                        if (primerValor == -1) {
                          primerValor = index;
                        } else {
                          segundoValor = index;
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
                      child: Center(child: Image.network(tarjetas[index].dato)),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.amber,
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
