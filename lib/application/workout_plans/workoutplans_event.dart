part of 'workoutplans_bloc.dart';

@immutable
sealed class WorkoutplansEvent {}

final class WorkoutPlanFetchRequestEvent extends WorkoutplansEvent {}
