import 'package:bloc/bloc.dart';
import 'package:fit_pro/domain/models/category_fetch/model.dart';
import 'package:fit_pro/infrastructure/repository/category_fetch/repo.dart';
import 'package:meta/meta.dart';

part 'category_fetch_event.dart';
part 'category_fetch_state.dart';

List<CategoryFetchModel>? categorylist;

class CategoryFetchBloc extends Bloc<CategoryFetchEvent, CategoryFetchState> {
  CategoryFetchBloc() : super(CategoryFetchInitial()) {
    List<CategoryFetchModel> response = [];
    on<CategoryFetchEvent>((event, emit) {
      emit(CategoryFetchInitial());
    });

    on<CategoryFetchReq>((event, emit) async {
      try {
        response = await CategoryRepository().fetchCategories(event.id);
        categorylist = response;
        emit(CategoryFetched(list: response, index: 0));
      } catch (e) {
        throw Exception(e.toString());
      }
    });
    on<NextWorkoutEvent>((event, emit) async {
      emit(CategoryFetchInitial());
      await Future.delayed(Duration(seconds: 1));
      emit(CategoryFetched(list: response, index: event.index + 1));
    });
  }
}
