import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'superset_buttons_event.dart';
part 'superset_buttons_state.dart';

class SupersetButtonsBloc
    extends Bloc<SupersetButtonsEvent, SupersetButtonsState> {
  SupersetButtonsBloc() : super(SupersetButtonsInitial()) {
    on<SupersetButtonsEvent>((event, emit) {
      emit(SupersetButtonsInitial());
    });
    on<Done>((event, emit) {
      emit(DoneState());
    });
    on<Gobak>((event, emit) => emit(Goback()));
  }
}
