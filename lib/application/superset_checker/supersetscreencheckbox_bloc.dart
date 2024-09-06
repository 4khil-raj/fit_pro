import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'supersetscreencheckbox_event.dart';
part 'supersetscreencheckbox_state.dart';

class SupersetscreencheckboxBloc
    extends Bloc<SupersetscreencheckboxEvent, SupersetscreencheckboxState> {
  SupersetscreencheckboxBloc() : super(SupersetscreencheckboxInitial()) {
    dynamic index;
    dynamic reps;
    dynamic weight;
    List<int> indexes = [];
    List<int> wrkDone = [];
    List<int> repslist = [];
    List<int> weightlist = [];
    Map<int, int> repsfulllist = {};
    Map<int, int> weightList = {};
    on<SupersetscreencheckboxEvent>((event, emit) {
      emit(SupersetscreencheckboxInitial());
    });
    on<GetRepss>((event, emit) {
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
    on<SuperSetCompletedWorkout>((event, emit) {
      wrkDone.add(event.index);
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
    on<ClearListt>((event, emit) {
      // emit(SupersetscreencheckboxInitial());
      weightList.clear();
      repsfulllist.clear();
      indexes = [];
      wrkDone = [];
      repslist = [];
      weightlist = [];
      emit(Selected(
        repsfulllist: repsfulllist,
        weightfulllist: weightList,
        repslist: repslist,
        weightlist: weightlist,
        done: wrkDone,
        list: indexes,
        isFinish: false,
        index: 0,
      ));
    });
    on<ClearRepss>((event, emit) {
      repsfulllist.remove(event.index);
      weightList.remove(event.index);
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
