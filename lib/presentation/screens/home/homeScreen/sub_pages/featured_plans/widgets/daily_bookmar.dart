import 'package:fit_pro/application/category_bloc/category_fetch_bloc.dart';
import 'package:fit_pro/application/fetch_bookmark_day/fetch_bookmark_bloc.dart';
import 'package:fit_pro/presentation/screens/bottom_nav/bottom_nav.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/sub_pages/featured_plans/widgets/bookmark_startwrk_button.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/sub_pages/featured_plans/widgets/day_builder_bookmark.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/widget/populate_workout_builder.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class BookmarkDayTaskScreen extends StatefulWidget {
  const BookmarkDayTaskScreen(
      {super.key,
      required this.videoLink,
      required this.title,
      required this.subTitle,
      required this.categoryId,
      required this.dayID,
      required this.lastTitle});
  final String categoryId;
  final String videoLink;
  final String title;
  final String subTitle;
  final String dayID;
  final String lastTitle;
  @override
  State<BookmarkDayTaskScreen> createState() => _DayTaskScreenState();
}

class _DayTaskScreenState extends State<BookmarkDayTaskScreen> {
  // final videourl = state.list[0]  "https://youtu.be/J212vz33gU4?si=cp2DT-HWP49Uj2hq";

  late YoutubePlayerController youtubePlayerController;

  @override
  void initState() {
    super.initState();
  }

  bool bookmark = true;
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<FetchBookmarkBloc>(context)
        .add(FetchBookmarkReq(dayId: ''));
    double screenWidth = MediaQuery.of(context).size.width;
    final videoId = YoutubePlayer.convertUrlToId(widget.videoLink);
    youtubePlayerController = YoutubePlayerController(
        initialVideoId: videoId!,
        flags: const YoutubePlayerFlags(autoPlay: false));

    // Calculate 10% of the screen width
    return BlocBuilder<FetchBookmarkBloc, FetchBookmarkState>(
      builder: (context, state) {
        if (state is FetchedDone) {
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 6, 2, 19),
            appBar: AppBar(
                iconTheme: const IconThemeData(color: Colors.white),
                backgroundColor: constBottomnavColor,
                title: Text(
                  'Day Task',
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                )),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  YoutubePlayer(
                    controller: youtubePlayerController,
                    showVideoProgressIndicator: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 6.0, top: 10),
                    child: Text(
                      widget.subTitle,
                      style: GoogleFonts.urbanist(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: const Color.fromARGB(255, 92, 178, 248)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.title,
                      style: GoogleFonts.urbanist(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: const Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 6.0,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        widget.lastTitle,
                        style: GoogleFonts.urbanist(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: const Color.fromARGB(255, 219, 213, 213)),
                      ),
                    ),
                  ),
                  // DailyTaskBuilderBookmarkScreen(
                  //   bookmarkIndex: widget.bookmarkIndex,
                  // ),

                  PopulateTaskBuilderScreen(
                    isWorkout: false,
                    Id: widget.dayID,
                    workout: false,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        // Container(
                        //     height: 50,
                        //     width: container1Width,
                        //     decoration: BoxDecoration(
                        //         border: Border.all(color: Colors.white),
                        //         color: Colors.transparent,
                        //         borderRadius: BorderRadius.circular(10)),
                        //     child: BookMarkButton(
                        //       bookmarkIndex: widget.bookmarkIndex,
                        //       bookmark: false,
                        //       dayIndex: 0,
                        //       weekIndex: 0,
                        //     )),
                        const SizedBox(
                          width: 15,
                        ),
                        BookmarkStartWorkoutButton(
                          categoryId: widget.categoryId,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }
        return Scaffold(
            backgroundColor: const Color.fromARGB(255, 6, 2, 19),
            body: Center(
              child: LoadingAnimationWidget.dotsTriangle(
                  // secondRingColor: Colors.green,
                  // thirdRingColor: Colors.blue,
                  color: Color.fromARGB(255, 255, 255, 255),
                  size: 62),
            ));
      },
    );
  }
}
