class TimerState {
  int duration;

  TimerState(duration);
}

class TimerInitial extends TimerState {
  TimerInitial(duration) : super(duration);

  @override
  String toString() => "TimerInitial $duration";
}

class TimerRunInProgress extends TimerState {
  TimerRunInProgress(duration) : super(duration);

  @override
  String toString() => "TimerRunInProgress $duration";
}

class TimerRunPause extends TimerState {
  TimerRunPause(duration) : super(duration);

  @override
  String toString() => "TimerRunPause $duration";
}

class TimerRunComplete extends TimerState {
  TimerRunComplete() : super(0);

  @override
  String toString() => "TimerInitial 0";
}
