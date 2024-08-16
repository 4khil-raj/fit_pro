import 'package:fit_pro/application/category_bloc/category_fetch_bloc.dart';
import 'package:fit_pro/application/fetch_bookmark_day/fetch_bookmark_bloc.dart';
import 'package:fit_pro/application/plan_overview/plan_overview_bloc.dart';
import 'package:fit_pro/infrastructure/repository/workout_fetch/repo.dart';
import 'package:fit_pro/presentation/screens/bottom_nav/bottom_nav.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/sub_pages/featured_plans/widgets/bookmark_button.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/sub_pages/featured_plans/widgets/daily_task_builder.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/sub_pages/featured_plans/widgets/start_workout_button_plan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

late YoutubePlayerController youtubePlayerControllerdailyTask;

class DayTaskScreen extends StatefulWidget {
  const DayTaskScreen(
      {super.key,
      this.bookmarkState,
      required this.appbarTitle,
      this.state,
      required this.weekIndex,
      required this.dayIndex,
      required this.bookmark});
  final String appbarTitle;
  final FetchedDone? bookmarkState;
  final PlanFetchDone? state;
  final int weekIndex;
  final int dayIndex;
  final bool bookmark;
  @override
  State<DayTaskScreen> createState() => _DayTaskScreenState();
}

class _DayTaskScreenState extends State<DayTaskScreen> {
  // final videourl = state.list[0]  "https://youtu.be/J212vz33gU4?si=cp2DT-HWP49Uj2hq";

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    youtubePlayerControllerdailyTask
        .pause(); // Pause the video when navigating away

    youtubePlayerControllerdailyTask.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  bool bookmark = true;
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<FetchBookmarkBloc>(context).add(FetchBookmarkReq(
        dayId: widget
            .state!.list[0].weeks[widget.weekIndex].days[widget.dayIndex].id));
    double screenWidth = MediaQuery.of(context).size.width;
    final videoId = YoutubePlayer.convertUrlToId(widget.state!.list[0]
        .weeks[widget.weekIndex].days[widget.dayIndex].introVideo);
    youtubePlayerControllerdailyTask = YoutubePlayerController(
        initialVideoId: videoId!,
        flags: const YoutubePlayerFlags(autoPlay: false));

    // Calculate 10% of the screen width
    double container1Width = screenWidth * 0.12;
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const SizedBox(
              height: 10,
              width: 30,
            ),
            Container(
                height: 50,
                width: container1Width,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10)),
                child: BookMarkButton(
                  bookmark: false,
                  dayIndex: widget.dayIndex,
                  statevalue: widget.state!,
                  weekIndex: widget.weekIndex,
                )),
            const SizedBox(
              width: 15,
            ),
            StartWorkoutPlanButton(
              dayIndex: widget.dayIndex,
              state: widget.state!,
              weekIndex: widget.weekIndex,
            )
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 6, 2, 19),
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: constBottomnavColor,
          title: Text(
            widget.appbarTitle,
            style: GoogleFonts.poppins(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),
          )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            YoutubePlayer(
              controller: youtubePlayerControllerdailyTask,
              showVideoProgressIndicator: true,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6.0, top: 10),
              child: Text(
                "${widget.appbarTitle} Challenge",
                style: GoogleFonts.urbanist(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: const Color.fromARGB(255, 92, 178, 248)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.state!.list[0].weeks[widget.weekIndex]
                    .days[widget.dayIndex].categories[0].subCategory,
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
                  widget.state!.list[0].weeks[widget.weekIndex]
                      .days[widget.dayIndex].dayName,
                  style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: const Color.fromARGB(255, 219, 213, 213)),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${widget.state?.list[0].weeks[widget.weekIndex].days[widget.dayIndex].categories.length} Exercises',
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            ),
            DailyTaskBuilderScreen(
              superset: false,
              dayIndex: widget.dayIndex,
              weekIndex: widget.weekIndex,
              state: widget.state!,
              // youtubePlayerControllerdailyTask: youtubePlayerControllerdailyTask,
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text(
            //     'Superset',
            //     style: GoogleFonts.poppins(
            //         color: Colors.white,
            //         fontSize: 17,
            //         fontWeight: FontWeight.bold),
            //   ),
            // ),
            // DailyTaskBuilderScreen(
            //   superset: true,

            //   dayIndex: widget.dayIndex,
            //   weekIndex: widget.weekIndex,
            //   state: widget.state!,
            //   // youtubePlayerControllerdailyTask: youtubePlayerControllerdailyTask,
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text(
            //     'Circuit',
            //     style: GoogleFonts.poppins(
            //         color: Colors.white,
            //         fontSize: 17,
            //         fontWeight: FontWeight.bold),
            //   ),
            // ),
            // DailyTaskBuilderScreen(
            //   superset: true,

            //   dayIndex: widget.dayIndex,
            //   weekIndex: widget.weekIndex,
            //   state: widget.state!,
            //   // youtubePlayerControllerdailyTask: youtubePlayerControllerdailyTask,
            // ),
            SizedBox(
              height: 80,
            )
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     children: [
            //       const SizedBox(
            //         height: 10,
            //       ),
            //       Container(
            //           height: 50,
            //           width: container1Width,
            //           decoration: BoxDecoration(
            //               border: Border.all(color: Colors.white),
            //               color: Colors.transparent,
            //               borderRadius: BorderRadius.circular(10)),
            //           child: BookMarkButton(
            //             bookmark: false,
            //             dayIndex: widget.dayIndex,
            //             statevalue: widget.state!,
            //             weekIndex: widget.weekIndex,
            //           )),
            //       const SizedBox(
            //         width: 15,
            //       ),
            //       StartWorkoutPlanButton(
            //         dayIndex: widget.dayIndex,
            //         state: widget.state!,
            //         weekIndex: widget.weekIndex,
            //       )
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
