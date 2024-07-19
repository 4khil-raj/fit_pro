part of 'workoutplans_bloc.dart';

@immutable
sealed class WorkoutplansState {}

final class WorkoutplansInitial extends WorkoutplansState {}

final class WorkoutLoadingState extends WorkoutplansState {}

final class WorkoutplansFetchedSuccessState extends WorkoutplansState {
  final List<WorkoutPlanModel> list;

  WorkoutplansFetchedSuccessState({required this.list});
}

final class WorkoutPlansFetchErrorState extends WorkoutplansState {
  final String message;
  WorkoutPlansFetchErrorState({required this.message});
}
