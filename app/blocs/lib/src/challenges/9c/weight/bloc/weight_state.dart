import 'package:equatable/equatable.dart';

abstract class WeightState extends Equatable {
  final int weight;

  const WeightState(this.weight);

  @override
  List<Object> get props => [weight];
}

class WeightInitial extends WeightState {
  const WeightInitial() : super(0);
}

class WeightSet extends WeightState {
  const WeightSet(int weight) : super(weight);
}
