import 'package:fit_pro/application/fetch_bookmark_day/fetch_bookmark_bloc.dart';
import 'package:fit_pro/application/plan_overview/plan_overview_bloc.dart';
import 'package:fit_pro/infrastructure/repository/add_bookmark/add.dart';
import 'package:fit_pro/infrastructure/repository/delete_bookmark/delete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class BookMarkButton extends StatelessWidget {
  final PlanFetchDone statevalue;
  final int weekIndex;
  final int dayIndex;
  final bool bookmark;

  const BookMarkButton(
      {super.key,
      required this.statevalue,
      required this.weekIndex,
      required this.dayIndex,
      required this.bookmark});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchBookmarkBloc, FetchBookmarkState>(
      builder: (context, state) {
        if (state is FetchedDone) {
          return state.added
              ? IconButton(
                  onPressed: () {
                    AddBookMarkRepo.addBookMark(
                        statevalue.list[0].weeks[weekIndex].days[dayIndex].id,
                        context);
                    BlocProvider.of<FetchBookmarkBloc>(context).add(
                        FetchBookmarkReq(
                            dayId: statevalue
                                .list[0].weeks[weekIndex].days[dayIndex].id));
                  },
                  icon: const Icon(
                    Icons.bookmark_outline,
                    color: Colors.white,
                  ))
              : IconButton(
                  onPressed: () {
                    DeleteBookMarkRepo.deleteBookMark(
                        statevalue.list[0].weeks[weekIndex].days[dayIndex].id,
                        context);
                    BlocProvider.of<FetchBookmarkBloc>(context).add(
                        FetchBookmarkReq(
                            dayId: statevalue
                                .list[0].weeks[weekIndex].days[dayIndex].id));
                  },
                  icon: Icon(
                    CupertinoIcons.delete,
                    color: Colors.red,
                  ));
        } else if (state is FetchLoading) {
          return LoadingAnimationWidget.fourRotatingDots(
            color: Colors.white,
            size: 20,
          );
        }
        return IconButton(
            onPressed: () {
              AddBookMarkRepo.addBookMark(
                  statevalue.list[0].weeks[weekIndex].days[dayIndex].id,
                  context);
              // BlocProvider.of<FetchBookmarkBloc>(context).add(FetchBookmarkReq(
              //     dayId:
              //         statevalue.list[0].weeks[weekIndex].days[dayIndex].id));
            },
            icon: const Icon(
              Icons.bookmark_outline,
              color: Colors.white,
            ));
      },
    );
  }
}
