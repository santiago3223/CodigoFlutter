import 'dart:async';

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

  void startBreak(bool isShort) {
    _radius = 1;
    _time = Duration(minutes: isShort ? shortBreak : longBreak);
    _fullTime = _time;
    _isActive = true;
  }

  void startWork() {
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
      time = returnTime(_time);
      return TimerModel(time, _radius);
    });
    print("Termino");
  }
}
