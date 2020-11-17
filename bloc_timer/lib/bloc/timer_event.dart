class TimerEvent {
  TimerEvent();
}

class TimerStarted extends TimerEvent {
  int duration;

  TimerStarted(this.duration);

  @override
  String toString() => "Timerstarted $duration";
}

class TimerPaused extends TimerEvent {}

class TimerResumed extends TimerEvent {}

class TimerReset extends TimerEvent {}

class TimerTicked extends TimerEvent {
  int duration;

  TimerTicked(this.duration);

  @override
  String toString() => "TimerTicked $duration";
}
