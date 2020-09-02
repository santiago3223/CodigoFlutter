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
    prefs.setInt("workTime", int.parse(txtWork.text));
    prefs.setInt("shortTime", int.parse(txtShort.text));
    prefs.setInt("longTime", int.parse(txtLong.text));
  }

  @override
  void initState() {
    txtWork = TextEditingController();
    txtShort = TextEditingController();
    txtLong = TextEditingController();
    readSettings();
    super.initState();
  }

  void increaseValue(TextEditingController controller) {
    controller.text = (int.parse(controller.text) + 1).toString();
  }

  void decreaseValue(TextEditingController controller) {
    controller.text = (int.parse(controller.text) - 1).toString();
  }

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
                    onPressed: () {
                      decreaseValue(txtWork);
                    }),
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
                    onPressed: () {
                      increaseValue(txtWork);
                    }),
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
          RaisedButton(
            onPressed: () {
              updateSettings();
            },
            child: Text("Guardar"),
          )
        ],
      ),
    );
  }
}
