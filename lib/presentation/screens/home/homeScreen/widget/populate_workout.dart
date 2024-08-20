import 'package:fit_pro/application/workout_fetch/workoutfetch_bloc.dart';
import 'package:fit_pro/presentation/screens/bottom_nav/bottom_nav.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/widget/populate_workout_builder.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/widget/start_workout_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

String? categoryIdWorkout;
late YoutubePlayerController workoutyoutubePlayerController;

class PopulateWorkout extends StatefulWidget {
  const PopulateWorkout({
    super.key,
    required this.appbarTitle,
    required this.categoryId,
    required this.index,
    required this.stateValues,
  });
  final String appbarTitle;
  final String categoryId;
  final int index;
  final WorkoutFetchDone stateValues;
  @override
  State<PopulateWorkout> createState() => _PopulateWorkoutScreenState();
}

class _PopulateWorkoutScreenState extends State<PopulateWorkout> {
  // final videourl = state.list[0]  "https://youtu.be/J212vz33gU4?si=cp2DT-HWP49Uj2hq";

  // late YoutubePlayerController workoutyoutubePlayerController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    workoutyoutubePlayerController.pause();
    workoutyoutubePlayerController.dispose();
  }

  bool bookmark = true;
  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<FetchBookmarkBloc>(context).add(FetchBookmarkReq(
    //     dayId: widget
    //         .state!.list[0].weeks[widget.weekIndex].days[widget.dayIndex].id));
    double screenWidth = MediaQuery.of(context).size.width;
    final videoId = YoutubePlayer.convertUrlToId(
        widget.stateValues.list[widget.index].workoutVideo);
    workoutyoutubePlayerController = YoutubePlayerController(
        initialVideoId: videoId!,
        flags: const YoutubePlayerFlags(autoPlay: false));

    // Calculate 10% of the screen width
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 30,
          ),
          StarWorkoutButtonInTW(
            index: widget.index,
            stateValues: widget.stateValues,
          ),
        ],
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
              controller: workoutyoutubePlayerController,
              showVideoProgressIndicator: true,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6.0, top: 10),
              child: Text(
                widget.stateValues.list[widget.index].workoutName ??
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
                widget.stateValues.list[widget.index].level,
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
                  widget.stateValues.list[widget.index].trainingType,
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
            PopulateTaskBuilderScreen(
              workout: true,
              Id: widget.stateValues.list[widget.index].id,
            ),
            const SizedBox(
              height: 70,
            ),
          ],
        ),
      ),
    );
  }
}
