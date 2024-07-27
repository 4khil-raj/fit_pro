import 'package:bloc/bloc.dart';
import 'package:fit_pro/domain/models/user_fetch/model.dart';
import 'package:fit_pro/infrastructure/repository/user_fetch/repo.dart';
import 'package:meta/meta.dart';

part 'userfetch_event.dart';
part 'userfetch_state.dart';

class UserfetchBloc extends Bloc<UserfetchEvent, UserfetchState> {
  UserfetchBloc() : super(UserfetchInitial()) {
    on<UserfetchEvent>((event, emit) {
      emit(UserfetchInitial());
    });
    on<UserFetchReq>((event, emit) async {
      final response = await UserRepository.fetchUser();
      print(response.user?.name);
      emit(UserFetched(usermodel: response));
    });
  }
}
