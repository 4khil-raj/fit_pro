import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:fit_pro/domain/models/fetch_bookmark/model.dart';
import 'package:fit_pro/infrastructure/repository/add_bookmark/fetch.dart';
import 'package:meta/meta.dart';
part 'fetch_bookmark_event.dart';
part 'fetch_bookmark_state.dart';

class FetchBookmarkBloc extends Bloc<FetchBookmarkEvent, FetchBookmarkState> {
  FetchBookmarkBloc() : super(FetchBookmarkInitial()) {
    on<FetchBookmarkEvent>((event, emit) {
      emit(FetchBookmarkInitial());
    });

    on<FetchBookmarkReq>((event, emit) async {
      emit(FetchLoading());
      try {
        final list = await FetchBookMarkRepo.fetchBookmarks();

        // Use Future.forEach to iterate over the bookmarks
        if (list[0].bookmarks.isNotEmpty) {
          bool isFound = false;

          await Future.forEach(list[0].bookmarks, (bookmark) async {
            if (bookmark.id == event.dayId) {
              isFound = true;
              emit(FetchedDone(list: list, added: false));
            }
          });

          if (!isFound) {
            emit(FetchedDone(list: list, added: true));
          }
        } else {
          emit(FetchBookmarkInitial());
        }
      } catch (e) {
        log(e.toString());
      }
    });
  }
}
