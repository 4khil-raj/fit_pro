part of 'category_fetch_bloc.dart';

@immutable
sealed class CategoryFetchState {}

final class CategoryFetchInitial extends CategoryFetchState {}

final class CategoryFetched extends CategoryFetchState {
  final List<CategoryFetchModel> list;
  final int index;

  CategoryFetched({
    required this.list,
    required this.index,
  });
}
