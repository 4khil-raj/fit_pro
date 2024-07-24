part of 'fetchweek_bloc.dart';

@immutable
sealed class FetchweekEvent {}

class FetchWeekReq extends FetchweekEvent {
  final String weekId;

  FetchWeekReq({required this.weekId});
}
