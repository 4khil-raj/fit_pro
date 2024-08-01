part of 'workoutfetch_bloc.dart';

@immutable
sealed class WorkoutfetchState {}

final class WorkoutfetchInitial extends WorkoutfetchState {}

final class WorkoutFetchDone extends WorkoutfetchState {
  final List<WorkoutFetchModel> list;

  WorkoutFetchDone({required this.list});
}
