import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<RememberMeEvent>((event, emit) {
      if (event.remember) {
        emit(RemembermeState(rememberme: false));
      } else {
        emit(RemembermeState(rememberme: true));
      }
    });
    on<ObsecureTextEvent>((event, emit) {
      if (event.obsecure) {
        emit(ObsecureTextState(obsecureText: false));
      } else {
        emit(ObsecureTextState(obsecureText: true));
      }
    });
  }
}
