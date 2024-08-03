import 'package:bloc/bloc.dart';
import 'package:fit_pro/presentation/screens/start_workout/widgets/buttons.dart';
import 'package:meta/meta.dart';

part 'workout_screen_buttons_event.dart';
part 'workout_screen_buttons_state.dart';

class WorkoutScreenButtonsBloc
    extends Bloc<WorkoutScreenButtonsEvent, WorkoutScreenButtonsState> {
  WorkoutScreenButtonsBloc() : super(WorkoutScreenButtonsInitial()) {
    on<WorkoutScreenButtonsEvent>((event, emit) {
      emit(WorkoutScreenButtonsInitial());
    });

    on<StartWrokoutButton>((event, emit) {
      stopWatchTimer.onStartTimer();
      emit(Started());
    });
    on<OneCompleateEvent>((event, emit) {
      stopWatchTimer.onStopTimer();
      emit(OneCompleateState());
    });
    on<WorkoutCompleateEvent>((event, emit) {
      stopWatchTimer.onStopTimer();

      emit(WorkoutCompleted());
    });
  }
}
