import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottom_nav_event.dart';
part 'bottom_nav_state.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  BottomNavBloc() : super(const BottomNavState(emittedIndex: 0)) {
    on<BottomnavcallEvent>((event, emit) {
      int index = event.currentIndex;
      emit(BottomNavState(emittedIndex: index));
    });
  }
}
