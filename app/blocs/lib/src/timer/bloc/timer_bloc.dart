import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blocs/src/timer/ticker.dart';
import 'package:meta/meta.dart';

import 'bloc.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  final Ticker _ticker;
  StreamSubscription<int> _tickerSubscription;

  TimerBloc({@required Ticker ticker})
      : assert(ticker != null),
        _ticker = ticker,
        super(TimerInitial());

  @override
  Stream<TimerState> mapEventToState(
    TimerEvent event,
  ) async* {
    if (event is TimerStart) {
      yield* _mapTimerStartToState(event);
    } else if (event is TimerTick) {
      yield* _mapTimerTickToState(event);
    } else if (event is TimerPause) {
      yield* _mapTimerPauseToState(event);
    } else if (event is TimerReset) {
      yield* _mapTimerResetToState(event);
    } else if (event is TimerResume) {
      yield* _mapTimerResumeToState(event);
    }
  }

  Stream<TimerState> _mapTimerStartToState(TimerStart event) async* {
    yield TimerInProgress(event.duration);
    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker
        .tick(ticks: event.duration)
        .listen((duration) => add(TimerTick(duration: duration)));
  }

  Stream<TimerState> _mapTimerTickToState(TimerTick event) async* {
    yield event.duration > 0
        ? TimerInProgress(event.duration)
        : TimerComplete();
  }

  Stream<TimerState> _mapTimerPauseToState(TimerPause event) async* {
    if (state is TimerInProgress) {
      _tickerSubscription?.pause();
      yield TimerPaused(state.duration);
    }
  }

  Stream<TimerState> _mapTimerResetToState(TimerReset event) async* {
    _tickerSubscription?.cancel();
    yield TimerInitial();
  }

  Stream<TimerState> _mapTimerResumeToState(TimerResume event) async* {
    if (state is TimerInProgress) {
      _tickerSubscription?.resume();
      yield TimerInProgress(state.duration);
    }
  }

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }
}
