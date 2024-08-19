import 'package:bloc/bloc.dart';
import 'package:fit_pro/domain/models/exercise_fetch/model.dart';
import 'package:fit_pro/infrastructure/repository/day_workout/repo.dart';
import 'package:fit_pro/infrastructure/repository/exercises/repo.dart';
import 'package:meta/meta.dart';

part 'exercisefetchbloc_event.dart';
part 'exercisefetchbloc_state.dart';

class ExercisefetchblocBloc
    extends Bloc<ExercisefetchblocEvent, ExercisefetchblocState> {
  ExercisefetchblocBloc() : super(ExercisefetchblocInitial()) {
    List<ExerciseSubClass> exercises = [];
    List<ExerciseSubClass> superSet = [];
    List<ExerciseSubClass> circute = [];
    var response;

    on<ExercisefetchblocEvent>((event, emit) {
      emit(ExercisefetchblocInitial());
    });
    on<ExerciseFetchRequestedEvent>((event, emit) async {
      try {
        response = await ExerciseFetchRepo.fetchExercises(event.workoutId);
        // exercises = response[0];
        // superSet = response[1];
        // circute = response[2];
        // emit(SuccessState(
        //     index: 0,
        //     exercises: response[0],
        //     superSet: response[1],
        //     circute: response[2]));
        emit(DataState(value: response));
      } catch (e) {
        emit(ErrorState(msg: e.toString()));
        print(e);
      }
    });

    on<WorkoutInPlans>((event, emit) async {
      try {
        final response = await DayWorkoutRepo.dayworkout(event.workoutId);
        exercises = response[0];
        superSet = response[1];
        circute = response[2];
        emit(SuccessState(
            index: 0,
            exercises: response[0],
            superSet: response[1],
            circute: response[2]));
      } catch (e) {
        emit(ErrorState(msg: e.toString()));
        print(e);
      }
    });
    on<NextWorkout>((event, emit) async {
      emit(ExercisefetchblocInitial());
      await Future.delayed(Duration(seconds: 1));
      emit(DataState(value: response, index: event.index + 1));
    });
  }
}
