import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'start_workout_event.dart';
part 'start_workout_state.dart';

class StartWorkoutBloc extends Bloc<StartWorkoutEvent, StartWorkoutState> {
  StartWorkoutBloc() : super(StartWorkoutInitial()) {
    on<StartWorkoutEvent>((event, emit) {
      event.value
          ? emit(RedoWorkout(value: false))
          : emit(RedoWorkout(value: true));
    });
  }
}
