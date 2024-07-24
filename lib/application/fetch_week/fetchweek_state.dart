part of 'fetchweek_bloc.dart';

@immutable
sealed class FetchweekState {}

final class FetchweekInitial extends FetchweekState {}

final class WeekSuccessState extends FetchweekState {
  final List<WeekModel> list;

  WeekSuccessState({required this.list});
}
