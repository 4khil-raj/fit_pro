part of 'repsandweightworkout_bloc.dart';

@immutable
sealed class RepsandweightworkoutState {}

final class RepsandweightworkoutInitial extends RepsandweightworkoutState {}

final class Selected extends RepsandweightworkoutState {
  final int index;
  final dynamic reps;
  final dynamic weight;
  final bool isFinish;
  final List<int> list;
  final List<int> done;
  final List<int> repslist;
  final List<int> weightlist;

  Selected(
      {required this.isFinish,
      required this.repslist,
      required this.weightlist,
      required this.done,
      required this.list,
      required this.index,
      required this.reps,
      required this.weight});
}
