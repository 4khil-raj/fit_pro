import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'repsandweightworkout_event.dart';
part 'repsandweightworkout_state.dart';

class RepsandweightworkoutBloc
    extends Bloc<RepsandweightworkoutEvent, RepsandweightworkoutState> {
  dynamic index;
  dynamic reps;
  dynamic weight;
  List<int> indexes = [];
  List<int> wrkDone = [];
  List<int> repslist = [];
  List<int> weightlist = [];
  RepsandweightworkoutBloc() : super(RepsandweightworkoutInitial()) {
    on<RepsandweightworkoutEvent>((event, emit) {
      emit(RepsandweightworkoutInitial());
    });
    on<GetReps>((event, emit) {
      index = event.index;
      reps = event.reps;
      weight = event.weight;
      indexes.add(event.index);
      repslist.add(reps);

      emit(Selected(
          repslist: repslist,
          weightlist: weightlist,
          done: wrkDone,
          list: indexes,
          isFinish: false,
          index: event.index,
          reps: event.reps,
          weight: event.weight));
    });
    on<WorkoutDone>((event, emit) {
      // emit(RepsandweightworkoutInitial());
      wrkDone.add(event.indexdone);
      emit(Selected(
          repslist: repslist,
          weightlist: weightlist,
          done: wrkDone,
          isFinish: true,
          list: indexes,
          index: index,
          reps: reps,
          weight: weight));
    });
  }
}
