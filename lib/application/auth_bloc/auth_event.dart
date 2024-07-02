part of 'auth_bloc.dart';

@immutable
class AuthEvent {}

class CheckLoginStatusEvent extends AuthEvent {}

class LoginEvent extends AuthEvent {
  final String email;

  final String passcode;
  LoginEvent({required this.email, required this.passcode});
}

class SignUpEvent extends AuthEvent {
  final SignUpModel user;
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

class SendOtpPhoneEvent extends AuthEvent {
  final String phone;
  SendOtpPhoneEvent({required this.phone});
}

class OnphoneOtpSend extends AuthEvent {
  final String verifiactionId;
  final int? token;

  OnphoneOtpSend({required this.token, required this.verifiactionId});
}

class VerifySentOtp extends AuthEvent {
  final String otpCode;
  final String verificationId;
  VerifySentOtp({required this.otpCode, required this.verificationId});
}

class OnOtpErrorEvent extends AuthEvent {
  final String msg;
  OnOtpErrorEvent({required this.msg});
}

class OnOtpAuthenticatedEvent extends AuthEvent {
  final AuthCredential credential;

  OnOtpAuthenticatedEvent({required this.credential});
}

final class FacebookAuthRequstEvent extends AuthEvent {}
