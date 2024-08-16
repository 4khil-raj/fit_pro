import 'package:bloc/bloc.dart';
import 'package:fit_pro/domain/models/workout_plans/model.dart';
import 'package:fit_pro/infrastructure/repository/workoutp_plans/repo.dart';
import 'package:meta/meta.dart';

part 'workoutplans_event.dart';
part 'workoutplans_state.dart';

class WorkoutplansBloc extends Bloc<WorkoutplansEvent, WorkoutplansState> {
  WorkoutplansBloc() : super(WorkoutplansInitial()) {
    on<WorkoutplansEvent>((event, emit) {
      emit(WorkoutplansInitial());
    });

    on<WorkoutPlanFetchRequestEvent>((event, emit) async {
      try {
        final list = await WorkoutPlansFetchRepo.fetchWorkoutPlans();

        if (list.isNotEmpty) {
          emit(WorkoutplansFetchedSuccessState(list: list));
        }
      } catch (e) {
        emit(WorkoutPlansFetchErrorState(message: "no values found"));
      }
    });
  }
}
