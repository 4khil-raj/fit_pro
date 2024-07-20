import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:fit_pro/core/apis/apis.dart';
import 'package:fit_pro/domain/models/signup/model.dart';
import 'package:fit_pro/infrastructure/facebook/repo.dart';
import 'package:fit_pro/infrastructure/login/repo.dart';
import 'package:fit_pro/infrastructure/otp_auth/repo.dart';
import 'package:fit_pro/infrastructure/repository/google_auth/repo.dart';
import 'package:fit_pro/infrastructure/signUp/otp_repo.dart';
import 'package:fit_pro/infrastructure/signUp/repo.dart';
import 'package:fit_pro/presentation/screens/auth/signin/signin.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    String loginResult = '';
    OtpAuthModel authModel = OtpAuthModel();
    bool? usercheck;
    UserCredential? userCredential;
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
        print(e);
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
        print(respose);
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
          // print(response['message']);
        } else {
          // emit(AuthError(message: response));
        }
      } catch (e) {
        emit(AuthError(message: e.toString()));
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
          Map<String, dynamic> req = {
            "email": user.email,
            "name": user.displayName,
            "profilePic": user.photoURL
          };
          final response = await http.post(
            Uri.parse(Apis.googleSignUp),
            headers: {
              'Content-Type': 'application/json',
            },
            body: jsonEncode(req),
          );
          final responseBody = jsonDecode(response.body);
          if (response.statusCode == 200) {
            emit(SignUpAuthSuccessState(
              google: false,
              other: false,
              user: user,
            ));
            await Future.delayed(const Duration(seconds: 2), () {
              emit(AuthInitial());
            });
          } else {
            emit(AuthError(message: responseBody["message"]));
          }

          // FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          //   'email': user.email,
          //   'name': user.displayName,
          //   // 'profilepicture': user.photoURL,
          // });
          // FirebaseFirestore.instance.collection('Profile').doc(user.uid).set({
          //   'email': user.email,
          //   'name': user.displayName,
          //   'profile_pic': user.photoURL,
          //   'phone': user.phoneNumber,
          //   'bio': 'Edit the bio',
          //   'uid': user.uid,
          //   'followers': 0,
          //   'following': 0,
          //   'post': 0
          // });
//ivite authenticated aa emit  cheyyande ippo thalkkalam signupAuthSuccess cheythunne ollu
          // emit(SignUpAuthSuccessState(
          //   google: false,
          //   other: false,
          //   user: user,
          // ));
          // await Future.delayed(const Duration(seconds: 2), () {
          //   emit(AuthInitial());
          // });
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
      if (user != null) {
        emit(SignUpAuthSuccessState(google: false, other: false));
      } else {
        emit(AuthError(message: "Check Connection"));
      }
    });
  }
}
