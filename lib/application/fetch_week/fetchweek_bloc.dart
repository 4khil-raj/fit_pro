import 'package:bloc/bloc.dart';
import 'package:fit_pro/domain/models/weeksmodel/model.dart';
import 'package:fit_pro/infrastructure/repository/weekrepo/repo.dart';
import 'package:meta/meta.dart';

part 'fetchweek_event.dart';
part 'fetchweek_state.dart';

class FetchweekBloc extends Bloc<FetchweekEvent, FetchweekState> {
  FetchweekBloc() : super(FetchweekInitial()) {
    on<FetchweekEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<FetchWeekReq>((event, emit) async {
      final response = await WeekFetchRepo.fetchWeek(event.weekId);
      print(response[0].id);
      print("++++++++++++++this is the week");
      emit(WeekSuccessState(list: response));
    });
  }
}
