import 'package:bloc/bloc.dart';
import 'bloc.dart';

class WeightBloc extends Bloc<WeightEvent, WeightState> {
  WeightBloc() : super(WeightInitial());

  @override
  Stream<WeightState> mapEventToState(
    WeightEvent event,
  ) async* {
    if (event is WeightUpdate) {
      yield* _mapWeightSetToState(event);
    }
  }

  Stream<WeightState> _mapWeightSetToState(WeightUpdate event) async* {
    yield WeightSet(event.weight);
  }
}
