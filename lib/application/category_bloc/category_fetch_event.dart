part of 'category_fetch_bloc.dart';

@immutable
sealed class CategoryFetchEvent {}

final class CategoryFetchReq extends CategoryFetchEvent {
  final String id;
  int? index;
  CategoryFetchReq({required this.id, this.index});
}

final class NextWorkoutEvent extends CategoryFetchEvent {
  final int index;

  NextWorkoutEvent({required this.index});
}
