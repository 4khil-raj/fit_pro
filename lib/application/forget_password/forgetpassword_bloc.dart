import 'package:bloc/bloc.dart';
import 'package:fit_pro/infrastructure/repository/forgetPassword/change_password.dart';
import 'package:fit_pro/infrastructure/repository/forgetPassword/get_link.dart';
import 'package:fit_pro/infrastructure/repository/forgetPassword/otp_validate.dart';
import 'package:meta/meta.dart';

part 'forgetpassword_event.dart';
part 'forgetpassword_state.dart';

String? otp;

class ForgetpasswordBloc
    extends Bloc<ForgetpasswordEvent, ForgetpasswordState> {
  ForgetpasswordBloc() : super(ForgetpasswordInitial()) {
    on<ForgetpasswordEvent>((event, emit) {
      emit(ForgetpasswordInitial());
    });
    on<GetOtpForget>((event, emit) async {
      try {
        final response = await ForgetGetOptRepo.getOtp(event.email);
        if (response) {
          emit(OTPsendSuccessState());
        } else {
          emit(ForgetErrorState(message: "No user found"));
        }
      } catch (e) {
        emit(ForgetErrorState(message: e.toString()));
      }
    });

    on<ValidateOtp>((event, emit) async {
      otp = event.otp;
      final response =
          await ValidateForgetOtp.validateOtp(event.email, event.otp);
      if (response) {
        emit(OtpValidateSuccess(email: event.email));
      } else {
        emit(ForgetErrorState(message: "invalid inputs"));
      }
    });

    on<ChangePasswordEvent>((event, emit) async {
      final response = await ChangePasswordRepo.changePasscode(
          event.email, event.password, otp!);
      if (response) {
        emit(ChangePasswordSuccess());
      } else {
        emit(ForgetErrorState(message: "Try again"));
      }
    });
  }
}
