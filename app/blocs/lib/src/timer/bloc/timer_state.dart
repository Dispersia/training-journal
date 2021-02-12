import 'package:equatable/equatable.dart';

abstract class TimerState extends Equatable {
  final int duration;

  const TimerState(this.duration);

  @override
  List<Object> get props => [duration];
}

class TimerInitial extends TimerState {
  const TimerInitial() : super(0);
}

class TimerInProgress extends TimerState {
  const TimerInProgress(int duration) : super(duration);
}

class TimerPaused extends TimerState {
  const TimerPaused(int duration) : super(duration);
}

class TimerComplete extends TimerState {
  const TimerComplete() : super(0);
}
