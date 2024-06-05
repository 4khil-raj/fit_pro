part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {
  final User? user;
  Authenticated({this.user});
}

class SignUpAuthSuccessState extends AuthState {
  final User? user;
  SignUpAuthSuccessState({required this.user});
}

final class RemembermeState extends AuthState {
  final bool rememberme;

  RemembermeState({required this.rememberme});
}

class ObsecureTextState extends AuthState {
  final bool obsecureText;

  ObsecureTextState({required this.obsecureText});
}

class UnAuthenticated extends AuthState {}

class AuthError extends AuthState {
  final String? message;

  AuthError({required this.message});
}

class AuthInitalState extends AuthState {}
