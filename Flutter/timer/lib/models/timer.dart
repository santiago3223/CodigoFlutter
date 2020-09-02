import 'dart:async';

import 'package:audioplayers/audio_cache.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timer/models/timerModel.dart';

class CountDownTimer {
  double _radius = 1;
  bool _isActive = true;
  Timer timer;
  Duration _time;
  Duration _fullTime;
  int work = 30;
  int longBreak = 20;
  int shortBreak = 2;
  SharedPreferences prefs;
  AudioCache player = AudioCache();

  void startBreak(bool isShort) async {
    await readSettings();
    _radius = 1;
    if (isShort) {
      _time = Duration(minutes: shortBreak);
    } else {
      _time = Duration(minutes: longBreak);
    }
    _time = Duration(minutes: isShort ? shortBreak : longBreak);
    _fullTime = _time;
    _isActive = true;
  }

  void startWork() async {
    await readSettings();
    _radius = 1;
    _time = Duration(minutes: work);
    _fullTime = _time;
    _isActive = true;
  }

  void stopTimer() {
    _isActive = false;
  }

  void startTimer() {
    _isActive = true;
  }

  void readSettings() async {
    prefs = await SharedPreferences.getInstance();
    work = prefs.getInt("workTime");
    shortBreak = prefs.getInt("shortTime");
    longBreak = prefs.getInt("longTime");
  }

  String returnTime(Duration t) {
    String minutes = t.inMinutes < 10
        ? '0' + t.inMinutes.toString()
        : t.inMinutes.toString();
    int segundosRestantes = t.inSeconds - t.inMinutes * 60;
    String seconds = segundosRestantes < 10
        ? '0' + segundosRestantes.toString()
        : segundosRestantes.toString();

    return minutes + ":" + seconds;
  }

  Stream<TimerModel> steam() async* {
    yield* Stream.periodic(Duration(seconds: 1), (i) {
      String time;
      if (this._isActive) {
        _time = _time - Duration(seconds: 1);
        _radius = _time.inSeconds / _fullTime.inSeconds;
        if (_time.inSeconds <= 0) {
          _isActive = false;
        }
      }
      if (_time.inSeconds % 10 == 0) {
        player.play('alerta.mp3');
      }

      if (_time.inSeconds <= 0 && !_isActive) {
        player.play('alerta.mp3');
      }

      time = returnTime(_time);
      return TimerModel(time, _radius);
    });
    print("Termino");
  }
}
