part of 'repsandweightworkout_bloc.dart';

@immutable
sealed class RepsandweightworkoutEvent {}

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
