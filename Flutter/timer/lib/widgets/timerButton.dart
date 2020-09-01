import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimerButton extends StatelessWidget {
  final Color color;
  final String text;
  final double size;
  final VoidCallback onPressed;

  TimerButton(
      {@required this.color,
      @required this.text,
      @required this.size,
      @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Text(
        this.text,
        style: TextStyle(color: Colors.white),
      ),
      color: this.color,
      minWidth: this.size,
      onPressed: this.onPressed,
    );
  }
}
