part of 'forgetpassword_bloc.dart';

@immutable
class ForgetpasswordEvent {}

final class GetOtpForget extends ForgetpasswordEvent {
  final String email;
  GetOtpForget({required this.email});
}

final class ValidateOtp extends ForgetpasswordEvent {
  final String otp;
  final String email;
  ValidateOtp({required this.otp, required this.email});
}

final class ChangePasswordEvent extends ForgetpasswordEvent {
  final String email;
  final String password;
  ChangePasswordEvent({required this.email, required this.password});
}
