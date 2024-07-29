part of 'category_fetch_bloc.dart';

@immutable
sealed class CategoryFetchEvent {}

final class CategoryFetchReq extends CategoryFetchEvent {
  final String id;

  CategoryFetchReq({required this.id});
}
