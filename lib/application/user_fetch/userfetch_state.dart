part of 'userfetch_bloc.dart';

@immutable
sealed class UserfetchState {}

final class UserfetchInitial extends UserfetchState {}

final class UserFetched extends UserfetchState {
  final UserFetchModel usermodel;

  UserFetched({required this.usermodel});
}
