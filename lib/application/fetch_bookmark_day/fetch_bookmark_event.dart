part of 'fetch_bookmark_bloc.dart';

@immutable
sealed class FetchBookmarkEvent {}

final class FetchBookmarkReq extends FetchBookmarkEvent {
  final String dayId;

  FetchBookmarkReq({required this.dayId});
}
