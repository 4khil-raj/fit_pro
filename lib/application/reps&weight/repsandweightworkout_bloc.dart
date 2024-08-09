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
  Map<int, int> repsfulllist = {};
  Map<int, int> weightList = {};
  RepsandweightworkoutBloc() : super(RepsandweightworkoutInitial()) {
    on<RepsandweightworkoutEvent>((event, emit) {
      // indexes.clear();
      // wrkDone.clear();
      // repslist.clear();
      // weightlist.clear();
      emit(RepsandweightworkoutInitial());
    });
    on<GetReps>((event, emit) {
      index = event.index;
      reps = event.reps;
      weight = event.weight;
      indexes.add(event.index);
      repslist.add(reps);
      repsfulllist[event.index] = event.reps;
      weightList[event.index] = event.weight;

      emit(Selected(
        repsfulllist: repsfulllist,
        weightfulllist: weightList,
        repslist: repslist,
        weightlist: weightlist,
        done: wrkDone,
        list: indexes,
        isFinish: false,
        index: event.index,
      ));
    });

    on<IconIndexPicker>((event, emit) {
      indexes.add(event.index);
      emit(RepsandweightworkoutInitial());
      emit(Selected(
        repsfulllist: repsfulllist,
        weightfulllist: weightList,
        repslist: repslist,
        weightlist: weightlist,
        done: wrkDone,
        list: indexes,
        isFinish: false,
        index: event.index,
      ));
    });
    on<WorkoutDone>((event, emit) {
      // emit(RepsandweightworkoutInitial());
      wrkDone.add(event.indexdone);
      emit(Selected(
        repsfulllist: repsfulllist,
        weightfulllist: weightList,
        repslist: repslist,
        weightlist: weightlist,
        done: wrkDone,
        isFinish: true,
        list: indexes,
        index: index,
      ));
    });
    on<ClearList>((event, emit) {
      indexes.clear();
      wrkDone.clear();
      repslist.clear();
      weightlist.clear();
      emit(RepsandweightworkoutInitial());
    });
    on<Checker>((event, emit) {
      int i = 0;
      for (i; i < event.totalLength; i++) {
        if (!wrkDone.contains(i)) {
          wrkDone.add(i);
          indexes.add(i);
          break;
        }
      }
      emit(Selected(
        repsfulllist: repsfulllist,
        weightfulllist: weightList,
        repslist: repslist,
        weightlist: weightlist,
        done: wrkDone,
        list: indexes,
        isFinish: false,
        index: i,
      ));
    });
  }
}
