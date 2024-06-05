part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class CheckLoginStatusEvent extends AuthEvent {}

class LoginEvent extends AuthEvent {
  final String email;

  final String passcode;
  LoginEvent({required this.email, required this.passcode});
}

class SignUpEvent extends AuthEvent {
  final UserModel user;
  SignUpEvent({required this.user});
}

class SignoutEvent extends AuthEvent {}

class LoggingInitialEvent extends AuthEvent {}

class RememberMeEvent extends AuthEvent {
  final bool remember;

  RememberMeEvent({required this.remember});
}

final class GoogleSigninEvent extends AuthEvent {}

class ObsecureTextEvent extends AuthEvent {
  final bool obsecure;
  ObsecureTextEvent({required this.obsecure});
}
