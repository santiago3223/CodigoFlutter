import 'package:flutter/material.dart';

class AnimatedContainerWidget extends StatefulWidget {
  @override
  _AnimatedContainerWidgetState createState() =>
      _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {
  double _height = 100;
  double _width = 100;
  Color _color = Colors.red;

  _increaseWidth() {
    setState(() {
      if (_width + 50 <= MediaQuery.of(context).size.width) {
        _width += 50;
      } else {
        if (_height + 50 <= MediaQuery.of(context).size.height) _height += 50;
      }
      _color = Colors.blue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedContainer(
          color: _color,
          duration: Duration(seconds: 1),
          curve: Curves.bounceInOut,
          height: _height,
          width: _width,
          child: FlatButton(
              onPressed: () {
                _increaseWidth();
              },
              child: Text("Crecer")),
        ),
      ],
    );
  }
}
