import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class WeightEvent extends Equatable {
  const WeightEvent();

  @override
  List<Object> get props => [];
}

class WeightUpdate extends WeightEvent {
  final int weight;

  const WeightUpdate({@required this.weight});
}
