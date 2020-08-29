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
      _turno = true;
    });

    _voltearTarjetas();
  }

  void _jugar(int i) {
    setState(() {
      if (_turno) {
        jugadas[i] = "X";
      } else {
        jugadas[i] = "O";
      }
      _turno = !_turno;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tres en raya"),
      ),
      body: GridView.builder(
        itemCount: 9,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: FlipCard(
            key: tarjetas[index],
            flipOnTouch: jugadas[index] == "",
            onFlip: () {
              if (tarjetas[index].currentState.isFront) {
                _jugar(index);
              }
            },
            front: Container(
              color: Colors.amber,
            ),
            back: Container(
              color: Colors.amber,
              child: Center(child: Text(jugadas[index])),
            ),
          ),
        ),
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
