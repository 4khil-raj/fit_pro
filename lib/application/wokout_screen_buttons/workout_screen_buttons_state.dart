part of 'workout_screen_buttons_bloc.dart';

@immutable
sealed class WorkoutScreenButtonsState {}

final class WorkoutScreenButtonsInitial extends WorkoutScreenButtonsState {}

final class OneCompleateState extends WorkoutScreenButtonsState {}

final class Started extends WorkoutScreenButtonsState {}

final class RestTimer extends WorkoutScreenButtonsState {}

final class WorkoutCompleted extends WorkoutScreenButtonsState {}
