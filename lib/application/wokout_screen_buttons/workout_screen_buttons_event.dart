part of 'workout_screen_buttons_bloc.dart';

@immutable
class WorkoutScreenButtonsEvent {}

final class OneCompleateEvent extends WorkoutScreenButtonsEvent {}

final class WorkoutCompleateEvent extends WorkoutScreenButtonsEvent {}

final class SkipButtonEvent extends WorkoutScreenButtonsEvent {}

final class StartWrokoutButton extends WorkoutScreenButtonsEvent {}
