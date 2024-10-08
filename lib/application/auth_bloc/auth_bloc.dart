import 'package:bloc/bloc.dart';
import 'package:fit_pro/domain/models/signup/model.dart';
import 'package:fit_pro/infrastructure/repository/facebook/repo.dart';
import 'package:fit_pro/infrastructure/repository/otp_auth/login/repo.dart';
import 'package:fit_pro/infrastructure/repository/otp_auth/repo.dart';
import 'package:fit_pro/infrastructure/repository/google_auth/repo.dart';
import 'package:fit_pro/infrastructure/repository/signUp/otp_repo.dart';
import 'package:fit_pro/infrastructure/repository/signUp/repo.dart';
import 'package:fit_pro/presentation/screens/auth/signin/signin.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    OtpAuthModel authModel = OtpAuthModel();
    bool? usercheck;
    final FirebaseAuth auth = FirebaseAuth.instance;
    on<AuthEvent>((event, emit) {
      emit(AuthInitial());
    });
//--------------->sign up<-----------------

    on<SignUpEvent>((event, emit) async {
      emit(AuthLoading(google: false, other: true));
      try {
        final response = await SignUpRepo.signupRequest(event.user);
        if (response == "done") {
          emit(SignUpOtpState(email: event.user.useremail));
        } else {
          emit(AuthError(message: response));
        }
      } catch (e) {
        throw Exception(e.toString());
      }
    });
    //remember me
    on<RememberMeEvent>((event, emit) {
      if (event.remember) {
        emit(RemembermeState(rememberme: false));
      } else {
        emit(RemembermeState(rememberme: true));
      }
    });

    on<SignUpOtpValidate>((event, emit) async {
      final respose = await SignUpOtpRepo().signupOtp(event.email, event.otp);
      if (respose == "faild") {
        emit(AuthError(message: "Invalid OTP"));
      } else {
        saveJWStocken(respose);
        emit(SignUpAuthSuccessState(google: false, other: false));
      }
    });

    //obsecure
    on<ObsecureTextEvent>((event, emit) {
      if (event.obsecure) {
        emit(ObsecureTextState(obsecureText: false));
      } else {
        emit(ObsecureTextState(obsecureText: true));
      }
    });

//----------login event---------
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading(google: false, other: true));
      try {
        final response = await LoginRepo.loginReq(event.passcode, event.email);
        if (response['status'] == 200) {
          saveJWStocken(response['accessToken']);
          emit(Authenticated());
        } else {
          emit(AuthError(message: response));
        }
      } catch (e) {
        emit(AuthError(message: 'Invalid Email or Password'));
      }
    });
    //sign out
    on<SignoutEvent>((event, emit) async {
      try {
        await auth.signOut();
        emit(UnAuthenticated());
      } catch (e) {
        emit(AuthError(message: e.toString()));
      }
    });

    //google auth

    on<GoogleSigninEvent>((event, emit) async {
      try {
        emit(AuthLoading(google: true, other: false));
        final user = await AuthRepository().signUpWithGoogle();

        if (user == null) {
          emit(AuthError(message: 'Can\'t find Your GoogleAccount'));
        } else {
          final resposne = await AuthRepository().googleSignupRequst(user);

          if (resposne["status"] == 200 && resposne['newUser']) {
            emit(SignUpAuthSuccessState(
              google: false,
              other: false,
              user: user,
            ));
            await Future.delayed(const Duration(seconds: 2), () {
              emit(AuthInitial());
            });
          } else if (resposne["status"] == 200 &&
              resposne['newUser'] == false) {
            emit(Authenticated(user: user));
            await Future.delayed(const Duration(seconds: 2), () {
              emit(AuthInitial());
            });
          } else {
            emit(AuthError(message: resposne));
          }
        }
      } catch (e) {
        emit(AuthError(message: e.toString()));
      }
    });
//otp
    on<SendOtpPhoneEvent>((event, emit) async {
      usercheck = await authModel.checkUser(event.phone);
      emit(OtpLoadingScreen());
      try {
        if (event.phone.isNotEmpty) {
          await authModel.loginWithPhone(
              phoneNumber: event.phone,
              verificationCompleted: (PhoneAuthCredential credential) {
                add(OnOtpAuthenticatedEvent(credential: credential));
              },
              verificationFailed: (FirebaseAuthException e) {
                add(OnOtpErrorEvent(msg: e.message.toString()));
              },
              codeSent: (String verificationId, int? refreshToken) {
                add(OnphoneOtpSend(
                    token: refreshToken, verifiactionId: verificationId));
              },
              codeAutoRetrievalTimeout: (String verifiacationId) {});
        } else {
          emit(OtpScreenErrorState(error: 'Enter Your Phone Number'));
        }
      } on FirebaseAuthException catch (e) {
        emit(OtpScreenErrorState(error: e.message.toString()));
      }
    });

    on<OnphoneOtpSend>((event, emit) {
      emit(PhoneAuthCodeSentSuccess(verificationId: event.verifiactionId));
    });

    on<VerifySentOtp>((event, emit) {
      try {
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: event.verificationId, smsCode: event.otpCode);
        add(OnOtpAuthenticatedEvent(credential: credential));
      } on FirebaseAuthException catch (e) {
        emit(OtpScreenErrorState(error: e.message.toString()));
      }
    });

    on<OnOtpErrorEvent>((event, emit) {
      emit(OtpScreenErrorState(error: event.msg));
    });

    on<OnOtpAuthenticatedEvent>((event, emit) async {
      try {
        await authModel.authentication
            .signInWithCredential(event.credential)
            .then((value) {
          emit(SignUpScreenOtpSuccessState());

          if (usercheck == true) {
            emit(OtpDonegotoHome());
          } else {
            emit(OtpLoadedState());
          }
        });
      } on FirebaseAuthException catch (e) {
        emit(OtpScreenErrorState(error: e.message.toString()));
      }
    });

    on<FacebookAuthRequstEvent>((event, emit) async {
      final user = await FaceBookAuthRepo().signInWithFacebook();
      // ignore: unnecessary_null_comparison
      if (user != null) {
        emit(SignUpAuthSuccessState(google: false, other: false));
      } else {
        emit(AuthError(message: "Check Connection"));
      }
    });
  }
}
