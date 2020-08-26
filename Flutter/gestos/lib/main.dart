import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DemoInputs(),
    );
  }
}

class DemoInputs extends StatefulWidget {
  @override
  _DemoInputsState createState() => _DemoInputsState();
}

class _DemoInputsState extends State<DemoInputs> {
  String texto = "";
  TextEditingController _controller = TextEditingController();

  void cambioValorTexto() {
    print(_controller.text);
    setState(() {
      texto = _controller.text;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(cambioValorTexto);
    print("Creando widget");
  }

  @override
  void dispose() {
    _controller.removeListener(cambioValorTexto);
    print("Murio widget");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("volviendo a dibujar");
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  inputFormatters: [
                    TextInputFormatter.withFunction(
                      (oldValue, newValue) {
                        return newValue.copyWith(
                            text: newValue.text.toUpperCase());
                      },
                    ),
                  ],
                  maxLength: 10,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.ac_unit),
                    labelText: "Ingrese texto",
                    hintText: "Ingrese su texto a invertir",
                    helperText: "Esta es una ayuda",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.name,
                  onChanged: (v) {
                    print("cambio $v");
                  },
                  onEditingComplete: () {
                    print("termino de editarse");
                  },
                  onSubmitted: (v) {
                    print("envio $v");
                  },
                  controller: _controller,
                ),
              ),
              RaisedButton(
                child: Text("Prueba"),
                onPressed: () {},
              )
            ],
          ),
          Text(texto.split('').reversed.join())
        ],
      ),
    );
  }
}
