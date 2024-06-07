part of 'user_info_bloc.dart';

@immutable
sealed class UserInfoState {}

final class UserInfoInitial extends UserInfoState {}

class UserGenderSuccessState extends UserInfoState {}

class UserAgeSuccessState extends UserInfoState {}

class UserGoalSuccessState extends UserInfoState {
  final int value;

  UserGoalSuccessState({required this.value});
}

class UserHeightSuccessState extends UserInfoState {}

class UserWeightSuccessState extends UserInfoState {}

class UserExperienceSuccessState extends UserInfoState {}

class UserCurrentlyWorkoutState extends UserInfoState {}

class UserWorkoutDayState extends UserInfoState {}
