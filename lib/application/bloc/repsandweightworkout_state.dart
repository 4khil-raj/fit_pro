part of 'repsandweightworkout_bloc.dart';

@immutable
sealed class RepsandweightworkoutState {}

final class RepsandweightworkoutInitial extends RepsandweightworkoutState {}

final class Selected extends RepsandweightworkoutState {
  final int index;
  final dynamic reps;
  final dynamic weight;

  Selected({required this.index, required this.reps, required this.weight});
}
