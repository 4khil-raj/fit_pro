part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class RememberMeEvent extends LoginEvent {
  final bool remember;

  RememberMeEvent({required this.remember});
}

class ObsecureTextEvent extends LoginEvent {
  final bool obsecure;
  ObsecureTextEvent({required this.obsecure});
}
