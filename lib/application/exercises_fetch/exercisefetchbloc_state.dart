part of 'exercisefetchbloc_bloc.dart';

@immutable
sealed class ExercisefetchblocState {}

final class ExercisefetchblocInitial extends ExercisefetchblocState {}

final class SuccessState extends ExercisefetchblocState {
  final List<ExerciseSubClass> exercises;
  final int index;
  final List<ExerciseSubClass> superSet;
  final List<ExerciseSubClass> circute;
  SuccessState(
      {required this.exercises,
      required this.superSet,
      required this.index,
      required this.circute});
}

final class ErrorState extends ExercisefetchblocState {
  final String msg;

  ErrorState({required this.msg});
}
