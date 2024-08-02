import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'repsandweightworkout_event.dart';
part 'repsandweightworkout_state.dart';

class RepsandweightworkoutBloc
    extends Bloc<RepsandweightworkoutEvent, RepsandweightworkoutState> {
  RepsandweightworkoutBloc() : super(RepsandweightworkoutInitial()) {
    on<RepsandweightworkoutEvent>((event, emit) {
      emit(RepsandweightworkoutInitial());
    });
    on<GetReps>((event, emit) {
      emit(
          Selected(index: event.index, reps: event.reps, weight: event.weight));
    });
  }
}
