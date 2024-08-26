part of 'supersetscreencheckbox_bloc.dart';

@immutable
sealed class SupersetscreencheckboxEvent {}

final class SuperSetCompletedWorkout extends SupersetscreencheckboxEvent {
  final int index;
  SuperSetCompletedWorkout({required this.index});
}

final class GetRepss extends SupersetscreencheckboxEvent {
  final int index;
  final dynamic reps;
  final dynamic weight;

  GetRepss({required this.index, required this.reps, required this.weight});
}

final class ClearListt extends SupersetscreencheckboxEvent {}

final class Checker extends SupersetscreencheckboxEvent {
  final int totalLength;

  Checker({required this.totalLength});
}

final class ClearRepss extends SupersetscreencheckboxEvent {
  final int index;
  ClearRepss({required this.index});
}
