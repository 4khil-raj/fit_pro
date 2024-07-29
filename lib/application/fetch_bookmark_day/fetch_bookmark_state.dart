part of 'fetch_bookmark_bloc.dart';

@immutable
sealed class FetchBookmarkState {}

final class FetchBookmarkInitial extends FetchBookmarkState {}

final class FetchedDone extends FetchBookmarkState {
  final List<FetchBookModel> list;
  final bool added;

  FetchedDone({required this.list, required this.added});
}

final class FetchLoading extends FetchBookmarkState {}
