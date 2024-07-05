part of 'start_workout_bloc.dart';

@immutable
sealed class StartWorkoutState {}

final class StartWorkoutInitial extends StartWorkoutState {}

final class RedoWorkout extends StartWorkoutState {
  final bool value;

  RedoWorkout({required this.value});
}
