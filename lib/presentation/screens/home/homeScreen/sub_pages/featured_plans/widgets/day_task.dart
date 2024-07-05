import 'package:fit_pro/presentation/screens/bottom_nav/bottom_nav.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/sub_pages/featured_plans/widgets/daily_task_builder.dart';
import 'package:fit_pro/presentation/screens/start_workout/start_workout.dart';
import 'package:fit_pro/presentation/widgets/buttons/button.dart';
import 'package:fit_pro/presentation/widgets/custom_nav/customnav.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DayTaskScreen extends StatefulWidget {
  DayTaskScreen(
      {super.key,
      this.detail,
      required this.appbarTitle,
      required this.title,
      required this.subtitle});
  final String appbarTitle;
  final String title;
  final String subtitle;
  String? detail;

  @override
  State<DayTaskScreen> createState() => _DayTaskScreenState();
}

class _DayTaskScreenState extends State<DayTaskScreen> {
  final videourl = "https://youtu.be/J212vz33gU4?si=cp2DT-HWP49Uj2hq";

  late YoutubePlayerController youtubePlayerController;

  @override
  void initState() {
    final videoId = YoutubePlayer.convertUrlToId(videourl);
    youtubePlayerController = YoutubePlayerController(
        initialVideoId: videoId!,
        flags: const YoutubePlayerFlags(autoPlay: false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

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
              widget.subtitle,
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
                widget.detail ?? "55 min | Body weight | 4 Rounds Total",
                style: GoogleFonts.urbanist(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: const Color.fromARGB(255, 219, 213, 213)),
              ),
            ),
          ),
          DailyTaskBuilderScreen(
            youtubePlayerController: youtubePlayerController,
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
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.bookmark_outline,
                        color: Colors.white,
                      )),
                ),
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
                        customNavRemoveuntil(context, StartWorkoutScreen());
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
