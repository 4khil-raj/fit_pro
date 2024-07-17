part of 'forgetpassword_bloc.dart';

@immutable
sealed class ForgetpasswordState {}

final class ForgetpasswordInitial extends ForgetpasswordState {}

final class OTPsendSuccessState extends ForgetpasswordState {}

final class ForgetErrorState extends ForgetpasswordState {
  final String message;

  ForgetErrorState({required this.message});
}

final class OtpValidateSuccess extends ForgetpasswordState {
  final String email;
  OtpValidateSuccess({required this.email});
}

final class ChangePasswordSuccess extends ForgetpasswordState {}
