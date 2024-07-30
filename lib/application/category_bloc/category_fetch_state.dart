part of 'category_fetch_bloc.dart';

@immutable
sealed class CategoryFetchState {}

final class CategoryFetchInitial extends CategoryFetchState {}

final class CategoryFetched extends CategoryFetchState {
  final List<CategoryFetchModel> list;

  CategoryFetched({required this.list});
}
