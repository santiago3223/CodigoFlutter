import 'package:flutter/material.dart';
import 'package:timer/widgets/timerButton.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Configuración"),
      ),
      body: Settings(),
    );
  }
}

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text("Trabajo:"),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
            child: Row(
              children: [
                TimerButton(
                    color: Color(0xff009688),
                    text: "-",
                    size: 100,
                    onPressed: () {}),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                  ),
                ),
                TimerButton(
                    color: Color(0xff009688),
                    text: "+",
                    size: 100,
                    onPressed: () {}),
              ],
            ),
          ),
          Text("Break corto:"),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
            child: Row(
              children: [
                TimerButton(
                    color: Color(0xff009688),
                    text: "-",
                    size: 100,
                    onPressed: () {}),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                  ),
                ),
                TimerButton(
                    color: Color(0xff009688),
                    text: "+",
                    size: 100,
                    onPressed: () {}),
              ],
            ),
          ),
          Text("Break largo:"),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
            child: Row(
              children: [
                TimerButton(
                    color: Color(0xff009688),
                    text: "-",
                    size: 100,
                    onPressed: () {}),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                  ),
                ),
                TimerButton(
                    color: Color(0xff009688),
                    text: "+",
                    size: 100,
                    onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
