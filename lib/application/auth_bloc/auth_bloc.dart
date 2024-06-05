import 'package:bloc/bloc.dart';
import 'package:fit_pro/domain/models/auth_model.dart/signup_user.dart';
import 'package:fit_pro/infrastructure/repository/google_auth/repo.dart';
import 'package:meta/meta.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    on<AuthEvent>((event, emit) {
      emit(AuthInitial());
    });
//--------------->sign up<-----------------
    on<SignUpEvent>((event, emit) async {
      try {
        final userCredential = await auth.createUserWithEmailAndPassword(
            email: event.user.email.toString(),
            password: event.user.password.toString());

        emit(AuthLoading());
        final user = userCredential.user;
        if (user != null) {
          FirebaseFirestore.instance.collection('users').doc(user.uid).set({
            'email': event.user.email,
            'passcode': event.user.password,
            'uid': user.uid
          });

          emit(SignUpAuthSuccessState(user: user));
        } else {
          emit(AuthError(message: 'Fill All details'));
        }
      } catch (e) {
        emit(AuthError(message: e.toString()));
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

    //obsecure
    on<ObsecureTextEvent>((event, emit) {
      if (event.obsecure) {
        emit(ObsecureTextState(obsecureText: false));
      } else {
        emit(ObsecureTextState(obsecureText: true));
      }
    });

    //login buttonclick

    on<LoginEvent>((event, emit) async {
      try {
        if (event.email.isNotEmpty && event.passcode.isNotEmpty) {
          emit(AuthLoading());
          UserCredential? userCredential =
              await auth.signInWithEmailAndPassword(
                  email: event.email, password: event.passcode);
          final user = userCredential.user;
          if (user != null) {
            emit(Authenticated(user: user));
          } else {
            emit(UnAuthenticated());
          }
        } else {
          emit(AuthError(message: 'Enter Valid info!!!'));
        }
      } on FirebaseAuthException catch (e) {
        emit(AuthError(message: e.message.toString()));
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
        emit(AuthLoading());
        final user = await AuthRepository().signUpWithGoogle();
        if (user == null) {
          emit(AuthError(message: 'Can\'t find Your GoogleAccount'));
        } else {
          FirebaseFirestore.instance.collection('users').doc(user.uid).set({
            'email': user.email,
            'name': user.displayName,
            // 'profilepicture': user.photoURL,
          });
          FirebaseFirestore.instance.collection('Profile').doc(user.uid).set({
            'email': user.email,
            'name': user.displayName,
            'profile_pic': user.photoURL,
            'phone': user.phoneNumber,
            'bio': 'Edit the bio',
            'uid': user.uid,
            'followers': 0,
            'following': 0,
            'post': 0
          });

          emit(Authenticated());
          await Future.delayed(const Duration(seconds: 2), () {
            emit(AuthInitial());
          });
        }
      } catch (e) {
        emit(AuthError(message: e.toString()));
      }
    });
  }
}
