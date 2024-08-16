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
      print('clicked');
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
      indexes.clear();
      wrkDone.clear();
      repslist.clear();
      weightlist.clear();
    });
  }
}
