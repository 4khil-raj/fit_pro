import 'package:fit_pro/application/category_bloc/category_fetch_bloc.dart';
import 'package:fit_pro/application/workout_fetch/workoutfetch_bloc.dart';
import 'package:fit_pro/infrastructure/repository/category_fetch/repo.dart';
import 'package:fit_pro/presentation/screens/bottom_nav/bottom_nav.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/widget/populate_workout_builder.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/widget/start_workout_button.dart';
import 'package:fit_pro/presentation/screens/start_workout/start_workout.dart';
import 'package:fit_pro/presentation/widgets/buttons/button.dart';
import 'package:fit_pro/presentation/widgets/custom_nav/customnav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

String? categoryIdWorkout;

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

  late YoutubePlayerController youtubePlayerController;

  @override
  void initState() {
    super.initState();
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
          PopulateTaskBuilderScreen(
            dayIndex: widget.index,
            stateValues: widget.stateValues,
            // youtubePlayerController: youtubePlayerController,
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
                //       bookmark: false,
                //       dayIndex: widget.dayIndex,
                //       statevalue: widget.state!,
                //       weekIndex: widget.weekIndex,
                //     )),
                // const SizedBox(
                //   width: 15,
                // ),
                // Expanded(
                //   child: Padding(
                //     padding: const EdgeInsets.all(6.0),
                //     child: CustomButton(
                //       isNetwork: false,
                //       isRow: false,
                //       color: const Color.fromARGB(255, 219, 203, 59),
                //       borderclr: const Color.fromARGB(255, 179, 165, 41),
                //       fontweight: FontWeight.w700,
                //       height: 50,
                //       name: "Start Workout",
                //       radius: 10,
                //       textclr: Colors.black,
                //       textsize: 14,
                //       onTap: () async {
                //         categoryIdWorkout =
                //             widget.stateValues.list[widget.index].categories[0];
                //         BlocProvider.of<CategoryFetchBloc>(context).add(
                //             CategoryFetchReq(
                //                 id: widget.stateValues.list[widget.index]
                //                     .categories[0]));

                //         // final response = await CategoryRepository()
                //         //     .fetchCategories(
                //         //         widget.stateValues.list[0].categories[0]);
                //         // print('========+++++++++++--------');
                //         // print(response[0].exercises[0].name);
                //         customNavPush(context, StartWorkoutScreen());
                //       },
                //     ),
                //   ),
                // )
                StarWorkoutButtonInTW(
                  index: widget.index,
                  stateValues: widget.stateValues,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
