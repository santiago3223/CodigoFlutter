import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculadora(),
    );
  }
}

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String _display = "0";
  List<String> _historial = [];
  double num1 = null;
  String operador = "";

  void _ingresarDigito(int digito) {
    String tmp = _display + digito.toString();
    double numtmp = double.tryParse(tmp);
    setState(() {
      if (numtmp % 1 == 0) {
        _display = numtmp.round().toString();
      } else {
        _display = numtmp.toString();
      }
    });
  }

  void _limpiarDisplay() {
    setState(() {
      _display = "0";
    });
  }

  void _ingresarOperador(String op) {
    num1 = double.tryParse(_display);
    operador = op;
    _historial.add(num1.toString() + " " + op);
    _limpiarDisplay();
  }

  void _obtenerResultado() {
    double num2 = double.tryParse(_display);
    setState(() {
      if (operador == "+") {
        _display = (num1 + num2).toString();
      } else if (operador == "-") {
        _display = (num1 - num2).toString();
      } else if (operador == "*") {
        _display = (num1 * num2).toString();
      } else if (operador == "/") {
        _display = (num1 / num2).toString();
      }
      _historial.last += " $num2 =" + _display;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              child: ListView.builder(
                itemCount: _historial.length,
                itemBuilder: (context, index) => Text(
                  _historial[index],
                  textAlign: TextAlign.right,
                ),
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              _display,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 40,
              ),
            ),
          )),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: RaisedButton(
                    onPressed: () {
                      setState(() {
                        _display = _display.substring(0, _display.length - 1);
                      });
                    },
                    child: Icon(Icons.backspace),
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text(""),
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text(""),
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    onPressed: () {
                      _limpiarDisplay();
                    },
                    child: Text("C"),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: RaisedButton(
                    onPressed: () {
                      _ingresarDigito(7);
                    },
                    child: Text("7"),
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    onPressed: () {
                      _ingresarDigito(8);
                    },
                    child: Text("8"),
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    onPressed: () {
                      _ingresarDigito(9);
                    },
                    child: Text("9"),
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    onPressed: () {
                      _ingresarOperador("/");
                    },
                    child: Text("/"),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: RaisedButton(
                    onPressed: () {
                      _ingresarDigito(4);
                    },
                    child: Text("4"),
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    onPressed: () {
                      _ingresarDigito(5);
                    },
                    child: Text("5"),
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    onPressed: () {
                      _ingresarDigito(6);
                    },
                    child: Text("6"),
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    onPressed: () {
                      _ingresarOperador("*");
                    },
                    child: Text("*"),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: RaisedButton(
                    onPressed: () {
                      _ingresarDigito(1);
                    },
                    child: Text("1"),
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    onPressed: () {
                      _ingresarDigito(2);
                    },
                    child: Text("2"),
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    onPressed: () {
                      _ingresarDigito(3);
                    },
                    child: Text("3"),
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    onPressed: () {
                      _ingresarOperador("-");
                    },
                    child: Text("-"),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: RaisedButton(
                    onPressed: () {
                      setState(() {
                        if (double.tryParse(_display + ".") != null) {
                          _display += ".";
                        }
                      });
                    },
                    child: Text("."),
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    onPressed: () {
                      _ingresarDigito(0);
                    },
                    child: Text("0"),
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    onPressed: () {
                      _obtenerResultado();
                    },
                    child: Text("="),
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    onPressed: () {
                      _ingresarOperador("+");
                    },
                    child: Text("+"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
