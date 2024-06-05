part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class RemembermeState extends LoginState {
  final bool rememberme;

  RemembermeState({required this.rememberme});
}

class ObsecureTextState extends LoginState {
  final bool obsecureText;

  ObsecureTextState({required this.obsecureText});
}
