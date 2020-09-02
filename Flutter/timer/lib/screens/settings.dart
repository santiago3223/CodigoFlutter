import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  TextEditingController txtWork;
  TextEditingController txtShort;
  TextEditingController txtLong;

  SharedPreferences prefs;

  void readSettings() async {
    prefs = await SharedPreferences.getInstance();
    print(prefs);
    int workTime = prefs.getInt("workTime");
    int shortTime = prefs.getInt("shortTime");
    int longTime = prefs.getInt("longTime");
    setState(() {
      txtWork.text = workTime.toString();
      txtShort.text = shortTime.toString();
      txtLong.text = longTime.toString();
    });
  }

  void updateSettings() {
    prefs.setInt("workTime", 45);
    prefs.setInt("shortTime", 2);
    prefs.setInt("longTime", 5);
  }

  @override
  void initState() {
    txtWork = TextEditingController();
    txtShort = TextEditingController();
    txtLong = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          RaisedButton(onPressed: () {
            updateSettings();
          }),
          RaisedButton(onPressed: () {
            readSettings();
          }),
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
                    controller: txtWork,
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
                    controller: txtShort,
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
                    controller: txtLong,
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
