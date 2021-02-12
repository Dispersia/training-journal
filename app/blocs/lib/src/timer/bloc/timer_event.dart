import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class TimerEvent extends Equatable {
  const TimerEvent();

  @override
  List<Object> get props => [];
}

class TimerStart extends TimerEvent {
  final int duration;

  const TimerStart({@required this.duration});

  @override
  List<Object> get props => [duration];
}

class TimerReset extends TimerEvent {}

class TimerPause extends TimerEvent {}

class TimerResume extends TimerEvent {}

class TimerTick extends TimerEvent {
  final int duration;

  const TimerTick({@required this.duration});

  @override
  List<Object> get props => [duration];
}
