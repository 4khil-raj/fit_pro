part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {
  final bool google;
  final bool other;

  AuthLoading({required this.google, required this.other});
}

class Authenticated extends AuthState {
  final User? user;
  Authenticated({this.user});
}

class SignUpAuthSuccessState extends AuthState {
  final User? user;
  final bool google;
  final bool other;
  SignUpAuthSuccessState(
      {required this.google, required this.other, this.user});
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

class OtpLoadingScreen extends AuthState {}

class OtpLoadedState extends AuthState {}

class OtpScreenErrorState extends AuthState {
  String error;
  OtpScreenErrorState({required this.error});
}

class PhoneAuthCodeSentSuccess extends AuthState {
  final String verificationId;

  PhoneAuthCodeSentSuccess({required this.verificationId});
}

class SignUpScreenOtpSuccessState extends AuthState {}

class Loadinghome extends AuthState {}

class Otploadingstate extends AuthState {}

class OtpDonegotoHome extends AuthState {}

class LoginSuccessState extends AuthState {}
