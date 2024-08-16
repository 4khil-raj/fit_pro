part of 'supersetscreencheckbox_bloc.dart';

@immutable
sealed class SupersetscreencheckboxState {}

final class SupersetscreencheckboxInitial extends SupersetscreencheckboxState {}

final class Selected extends SupersetscreencheckboxState {
  final int index;

  final bool isFinish;
  final List<int> list;
  final List<int> done;
  final List<int> repslist;
  final List<int> weightlist;
  final Map<int, int> weightfulllist;
  final Map<int, int> repsfulllist;

  Selected({
    required this.isFinish,
    required this.weightfulllist,
    required this.repsfulllist,
    required this.repslist,
    required this.weightlist,
    required this.done,
    required this.list,
    required this.index,
  });
}
