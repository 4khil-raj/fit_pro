part of 'user_info_bloc.dart';

@immutable
class UserInfoEvent {}

class GenderSelectEvent extends UserInfoEvent {}

class AgeSelectEvent extends UserInfoEvent {}

class GoalSelectEvent extends UserInfoEvent {}

class WeightPickerEvent extends UserInfoEvent {
  final int value;

  WeightPickerEvent({required this.value});
}

class HeightSelectEvent extends UserInfoEvent {}

class WeightSelectEvent extends UserInfoEvent {}

class ExperenceSelectEvent extends UserInfoEvent {}

class CurrentlyWorkoutEvent extends UserInfoEvent {}

class WorkoutDaysEvent extends UserInfoEvent {}

final class NavigatorPopEvent extends UserInfoEvent {
  final int pageNo;

  NavigatorPopEvent({required this.pageNo});
}
