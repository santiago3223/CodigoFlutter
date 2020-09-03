import 'package:flutter/material.dart';

class AnimatedOpacityWidget extends StatefulWidget {
  @override
  _AnimatedOpacityWidgetState createState() => _AnimatedOpacityWidgetState();
}

class _AnimatedOpacityWidgetState extends State<AnimatedOpacityWidget> {
  double _opacity = 0.3;

  _increaseOpacity() {
    setState(() {
      _opacity += 0.1;
      if (_opacity < 0) _opacity = 0;
      if (_opacity > 1) _opacity = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RaisedButton(onPressed: () {
          _increaseOpacity();
        }),
        AnimatedOpacity(
          opacity: _opacity,
          duration: Duration(milliseconds: 500),
          child: Container(
            width: 100,
            height: 100,
            color: Colors.amber,
          ),
        )
      ],
    );
  }
}
