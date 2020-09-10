import 'package:demo_provider/providers/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BotonContador extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterProvider cProvider = Provider.of<CounterProvider>(context);
    return RaisedButton(
      onPressed: () => cProvider.incrementCounter(),
    );
  }
}
