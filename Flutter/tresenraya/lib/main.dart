import 'dart:math';

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
      home: TresEnRaya(),
    );
  }
}

class TresEnRaya extends StatefulWidget {
  @override
  _TresEnRayaState createState() => _TresEnRayaState();
}

class _TresEnRayaState extends State<TresEnRaya> {
  bool _turno = true; // true: X  , false: O
  bool _singanador = true;
  bool _dosjugadores = true;
  List<String> jugadas = [];
  List<GlobalKey<FlipCardState>> tarjetas = [];

  @override
  void initState() {
    _refrescarJuego();
    tarjetas = [];
    for (int i = 0; i < jugadas.length; i++) {
      tarjetas.add(GlobalKey<FlipCardState>());
    }
    super.initState();
  }

  void _voltearTarjetas() {
    for (int i = 0; i < tarjetas.length; i++) {
      if (!tarjetas[i].currentState.isFront) {
        tarjetas[i].currentState.toggleCard();
      }
    }
  }

  void _refrescarJuego() {
    setState(() {
      jugadas = [
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
      ];
      _singanador = true;
      _turno = true;
    });

    _voltearTarjetas();
  }

  _mostrarGanador(BuildContext context, String ganador) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Ganador: $ganador"),
          );
        });
  }

  void _jugar(int i, BuildContext context) {
    setState(() {
      if (_turno) {
        jugadas[i] = "X";
      } else {
        jugadas[i] = "O";
      }

      if (_hayGanador()) {
        print("Gano ${_turno ? 'X' : 'O'}");
        _mostrarGanador(context, _turno ? 'X' : 'O');
        _singanador = false;
      }
      _turno = !_turno;
    });
  }

  void _jugarMaquina() {
    if (!_dosjugadores) {
      if (!_turno) {
        int inicioh = _obtenerJugadaHorizontal();
        int iniciov = _obtenerJugadaVertical();
        if (iniciov >= 0) {
          for (int j = iniciov; j < 3; j++) {
            for (int i = 0; i < 3; i++) {
              if (jugadas[i * 3 + j] == "") {
                tarjetas[i * 3 + j].currentState.toggleCard();
                return;
              }
            }
          }
        } else {
          for (int j = inicioh; j < jugadas.length; j++) {
            if (jugadas[j] == "") {
              tarjetas[j].currentState.toggleCard();
              return;
            }
          }
        }
      }
    }
  }

  int _obtenerJugadaVertical() {
    int jugadasPorFila = 0;
    for (int j = 0; j < 3; j++) {
      jugadasPorFila = 0;
      for (int i = 0; i < 3; i++) {
        if (jugadas[i * 3 + j] == "X") jugadasPorFila++;
      }
      if (jugadasPorFila == 2) {
        return j;
      }
    }
    return -1;
  }

  int _obtenerJugadaHorizontal() {
    int jugadasPorFila = 0;
    for (int j = 0; j < 3; j++) {
      jugadasPorFila = 0;
      for (int i = 0; i < 3; i++) {
        if (jugadas[j * 3 + i] == "X") jugadasPorFila++;
      }
      if (jugadasPorFila == 2) {
        return j * 3;
      }
    }
    return 0;
  }

  bool _hayGanador() {
    String resp = "O";
    if (_turno) {
      resp = "X";
    }

    if ((jugadas[0] == resp) && (jugadas[1] == resp) && (jugadas[2] == resp)) {
      return true;
    }
    if ((jugadas[3] == resp) && (jugadas[4] == resp) && (jugadas[5] == resp)) {
      return true;
    }
    if ((jugadas[6] == resp) && (jugadas[7] == resp) && (jugadas[8] == resp)) {
      return true;
    }
    if ((jugadas[0] == resp) && (jugadas[3] == resp) && (jugadas[6] == resp)) {
      return true;
    }
    if ((jugadas[1] == resp) && (jugadas[4] == resp) && (jugadas[7] == resp)) {
      return true;
    }
    if ((jugadas[2] == resp) && (jugadas[5] == resp) && (jugadas[8] == resp)) {
      return true;
    }
    if ((jugadas[0] == resp) && (jugadas[4] == resp) && (jugadas[8] == resp)) {
      return true;
    }
    if ((jugadas[2] == resp) && (jugadas[4] == resp) && (jugadas[6] == resp)) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tres en raya"),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("1 Jugador"),
              Switch(
                value: _dosjugadores,
                onChanged: (value) {
                  setState(() {
                    _dosjugadores = value;
                  });
                },
              ),
              Text("2 Jugadores"),
            ],
          ),
          Text(
            "Tuno de : ${_turno ? 'X' : 'O'}",
            style: TextStyle(fontSize: 20),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: 9,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlipCard(
                  key: tarjetas[index],
                  flipOnTouch: jugadas[index] == "" && _singanador,
                  onFlipDone: (isFront) {
                    _jugarMaquina();
                  },
                  onFlip: () {
                    if (tarjetas[index].currentState.isFront) {
                      _jugar(index, context);
                    }
                  },
                  front: Container(
                    color: Colors.amber,
                  ),
                  back: Container(
                    color: Colors.amber,
                    child: Center(
                      child: jugadas[index] == "O"
                          ? Icon(
                              Icons.radio_button_unchecked,
                              size: 40,
                            )
                          : jugadas[index] == "X"
                              ? Icon(
                                  Icons.close,
                                  size: 40,
                                )
                              : Text(""),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _refrescarJuego();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
