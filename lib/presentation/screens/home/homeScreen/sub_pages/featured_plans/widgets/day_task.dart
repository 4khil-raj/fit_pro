import 'package:fit_pro/application/fetch_bookmark/fetch_bookmark_bloc.dart';
import 'package:fit_pro/application/plan_overview/plan_overview_bloc.dart';
import 'package:fit_pro/presentation/screens/bottom_nav/bottom_nav.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/sub_pages/featured_plans/widgets/bookmark_button.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/sub_pages/featured_plans/widgets/daily_task_builder.dart';
import 'package:fit_pro/presentation/widgets/buttons/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DayTaskScreen extends StatefulWidget {
  const DayTaskScreen(
      {super.key,
      required this.appbarTitle,
      required this.state,
      required this.weekIndex,
      required this.dayIndex});
  final String appbarTitle;

  final PlanFetchDone state;
  final int weekIndex;
  final int dayIndex;
  @override
  State<DayTaskScreen> createState() => _DayTaskScreenState();
}

class _DayTaskScreenState extends State<DayTaskScreen> {
  // final videourl = state.list[0]  "https://youtu.be/J212vz33gU4?si=cp2DT-HWP49Uj2hq";

  late YoutubePlayerController youtubePlayerController;

  @override
  void initState() {
    super.initState();
  }

  bool bookmark = true;
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<FetchBookmarkBloc>(context).add(FetchBookmarkReq(
        dayId: widget
            .state.list[0].weeks[widget.weekIndex].days[widget.dayIndex].id));
    double screenWidth = MediaQuery.of(context).size.width;
    final videoId = YoutubePlayer.convertUrlToId(widget.state.list[0]
        .weeks[widget.weekIndex].days[widget.dayIndex].introVideo);
    youtubePlayerController = YoutubePlayerController(
        initialVideoId: videoId!,
        flags: const YoutubePlayerFlags(autoPlay: false));

    // Calculate 10% of the screen width
    double container1Width = screenWidth * 0.12;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 6, 2, 19),
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: constBottomnavColor,
          title: Text(
            widget.appbarTitle,
            style: GoogleFonts.poppins(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          YoutubePlayer(
            controller: youtubePlayerController,
            showVideoProgressIndicator: true,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 6.0, top: 10),
            child: Text(
              "Week 1 Challenge",
              style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: const Color.fromARGB(255, 92, 178, 248)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.state.list[0].weeks[widget.weekIndex].days[widget.dayIndex]
                  .categories[0].subCategory,
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
                widget.state.list[0].weeks[widget.weekIndex]
                    .days[widget.dayIndex].dayName,
                style: GoogleFonts.urbanist(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: const Color.fromARGB(255, 219, 213, 213)),
              ),
            ),
          ),
          DailyTaskBuilderScreen(
            dayIndex: widget.dayIndex,
            weekIndex: widget.weekIndex,
            state: widget.state,
            // youtubePlayerController: youtubePlayerController,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                    height: 50,
                    width: container1Width,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10)),
                    child:
                        // IconButton(
                        //     onPressed: () {
                        //       print(
                        //         widget.state.list[0].weeks[widget.weekIndex]
                        //             .days[widget.dayIndex].id,
                        //       );
                        //       bookmark
                        //           ? AddBookMarkRepo.addBookMark(
                        //               widget.state.list[0].weeks[widget.weekIndex]
                        //                   .days[widget.dayIndex].id,
                        //               context)
                        //           : DeleteBookMarkRepo.deleteBookMark(
                        //               widget.state.list[0].weeks[widget.weekIndex]
                        //                   .days[widget.dayIndex].id,
                        //               context);

                        //       setState(() {
                        //         bookmark = !bookmark;
                        //       });
                        //     },
                        //     icon: const Icon(
                        //       Icons.bookmark_outline,
                        //       color: Colors.white,
                        //     )),
                        BookMarkButton(
                      dayIndex: widget.dayIndex,
                      statevalue: widget.state,
                      weekIndex: widget.weekIndex,
                    )),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: CustomButton(
                      isNetwork: false,
                      isRow: false,
                      color: const Color.fromARGB(255, 219, 203, 59),
                      borderclr: const Color.fromARGB(255, 179, 165, 41),
                      fontweight: FontWeight.w700,
                      height: 50,
                      name: "Start Workout",
                      radius: 10,
                      textclr: Colors.black,
                      textsize: 14,
                      onTap: () {
                        print(widget.state.list[0].weeks[widget.weekIndex]
                            .days[widget.dayIndex].id);
                        // customNavRemoveuntil(context, StartWorkoutScreen());
                      },
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
