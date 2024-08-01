import 'package:bloc/bloc.dart';
import 'package:fit_pro/domain/models/workout_model/model.dart';
import 'package:fit_pro/infrastructure/repository/workout_fetch/repo.dart';
import 'package:meta/meta.dart';

part 'workoutfetch_event.dart';
part 'workoutfetch_state.dart';

class WorkoutfetchBloc extends Bloc<WorkoutfetchEvent, WorkoutfetchState> {
  WorkoutfetchBloc() : super(WorkoutfetchInitial()) {
    on<WorkoutfetchEvent>((event, emit) {
      emit(WorkoutfetchInitial());
    });
    on<WorkoutFetch>((event, emit) async {
      final response = await WorkoutRepository().fetchWorkouts();
      emit(WorkoutFetchDone(list: response));
    });
  }
}
