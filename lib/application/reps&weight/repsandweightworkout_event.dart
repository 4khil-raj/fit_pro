part of 'repsandweightworkout_bloc.dart';

@immutable
class RepsandweightworkoutEvent {}

final class GetReps extends RepsandweightworkoutEvent {
  final int index;
  final dynamic reps;
  final dynamic weight;

  GetReps({required this.index, required this.reps, required this.weight});
}

final class WorkoutDone extends RepsandweightworkoutEvent {
  final int indexdone;

  WorkoutDone({required this.indexdone});
}

final class ClearList extends RepsandweightworkoutEvent {}

final class IconIndexPicker extends RepsandweightworkoutEvent {
  final int index;
  IconIndexPicker({required this.index});
}

final class Checker extends RepsandweightworkoutEvent {
  final int totalLength;

  Checker({required this.totalLength});
}

final class ClearReps extends RepsandweightworkoutEvent {
  final int index;

  ClearReps({required this.index});
}
