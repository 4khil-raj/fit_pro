part of 'exercisefetchbloc_bloc.dart';

@immutable
sealed class ExercisefetchblocEvent {}

final class ExerciseFetchRequestedEvent extends ExercisefetchblocEvent {
  final String workoutId;

  ExerciseFetchRequestedEvent({required this.workoutId});
}

final class NextWorkouts extends ExercisefetchblocEvent {
  final int index;

  NextWorkouts({required this.index});
}

final class WorkoutInPlans extends ExercisefetchblocEvent {
  final String workoutId;
  WorkoutInPlans({required this.workoutId});
}
