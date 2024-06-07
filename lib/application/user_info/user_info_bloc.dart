import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_info_event.dart';
part 'user_info_state.dart';

class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState> {
  UserInfoBloc() : super(UserInfoInitial()) {
    on<UserInfoEvent>((event, emit) {
      emit(UserInfoInitial());
    });

    on<GenderSelectEvent>((event, emit) {
      emit(UserGenderSuccessState());
    });
    on<AgeSelectEvent>((event, emit) {
      emit(UserAgeSuccessState());
    });

    on<GoalSelectEvent>((event, emit) => emit(UserGoalSuccessState(value: 0)));

    on<WeightPickerEvent>(
        (event, emit) => emit(UserGoalSuccessState(value: event.value)));

    on<HeightSelectEvent>((event, emit) => emit(UserHeightSuccessState()));

    on<WeightSelectEvent>((event, emit) => emit(UserWeightSuccessState()));

    on<ExperenceSelectEvent>(
        (event, emit) => emit(UserExperienceSuccessState()));
  }
}
