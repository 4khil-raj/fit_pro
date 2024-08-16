part of 'exercisefetchbloc_bloc.dart';

@immutable
sealed class ExercisefetchblocEvent {}

final class ExerciseFetchRequestedEvent extends ExercisefetchblocEvent {
  final String workoutId;

  ExerciseFetchRequestedEvent({required this.workoutId});
}

final class NextWorkout extends ExercisefetchblocEvent {
  final int index;

  NextWorkout({required this.index});
}
