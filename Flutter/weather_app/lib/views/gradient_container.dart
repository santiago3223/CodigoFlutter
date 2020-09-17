import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  final MaterialColor color;
  final Widget child;

  const GradientContainer({this.color, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [color[800], color[400]]),
      ),
    );
  }
}
