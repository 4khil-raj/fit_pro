import 'package:bloc/bloc.dart';
import 'package:fit_pro/domain/models/category_fetch/model.dart';
import 'package:fit_pro/infrastructure/repository/category_fetch/repo.dart';
import 'package:meta/meta.dart';

part 'category_fetch_event.dart';
part 'category_fetch_state.dart';

class CategoryFetchBloc extends Bloc<CategoryFetchEvent, CategoryFetchState> {
  CategoryFetchBloc() : super(CategoryFetchInitial()) {
    on<CategoryFetchEvent>((event, emit) {
      emit(CategoryFetchInitial());
    });

    on<CategoryFetchReq>((event, emit) async {
      try {
        final response = await CategoryRepository().fetchCategories(event.id);

        emit(CategoryFetched(list: response));
      } catch (e) {
        print(e);
      }
    });
  }
}
