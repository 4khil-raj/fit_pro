import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'category_fetch_event.dart';
part 'category_fetch_state.dart';

class CategoryFetchBloc extends Bloc<CategoryFetchEvent, CategoryFetchState> {
  CategoryFetchBloc() : super(CategoryFetchInitial()) {
    on<CategoryFetchEvent>((event, emit) {
      emit(CategoryFetchInitial());
    });
  }
}
