// ignore_for_file: prefer_const_constructors

import 'package:fit_pro/presentation/screens/bottom_nav/bottom_nav.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/sub_pages/featured_plans/widgets/week1_carosel.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/sub_pages/featured_plans/widgets/week2_carosel.dart';
import 'package:fit_pro/presentation/widgets/buttons/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FeaturedPlanOverviewScreen extends StatefulWidget {
  const FeaturedPlanOverviewScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle,
      required this.task});
  final String image;
  final String title;
  final String subTitle;
  final String task;

  @override
  State<FeaturedPlanOverviewScreen> createState() =>
      _FeaturedPlanOverviewScreenState();
}

class _FeaturedPlanOverviewScreenState
    extends State<FeaturedPlanOverviewScreen> {
  final videourl = "https://youtu.be/eMjyvIQbn9M?si=3EntHPR3yGvnyBjl";

  late YoutubePlayerController youtubePlayerController;
  @override
  void initState() {
    final videoId = YoutubePlayer.convertUrlToId(videourl);
    youtubePlayerController = YoutubePlayerController(
        initialVideoId: videoId!, flags: YoutubePlayerFlags(autoPlay: false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 6, 2, 19),
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: constBottomnavColor,
          title: Text(
            "Plan Overview",
            style: GoogleFonts.poppins(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),
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
              padding: const EdgeInsets.all(13.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: GoogleFonts.urbanist(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color.fromARGB(255, 92, 178, 248)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.subTitle,
                      style: GoogleFonts.urbanist(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        widget.task,
                        style: GoogleFonts.urbanist(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color.fromARGB(255, 219, 213, 213)),
                      ),
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    Text(
                      "Welcome to my 14-day challenge plan, a workout plan for men who want to plan their training to achieve their fitness goals effectively. This plan will guide you through structured workouts, helping you stay on track and maximize your results.",
                      style: TextStyle(
                          color: const Color.fromARGB(255, 210, 205, 205)),
                    ),
                    // // TextButton(onPressed: () {}, child: Text("see more")),
                    // Text("n two weeks.")
                  ],
                ),
              ),
            ),
            WeekOneCarouselSlider(),
            WeekTwoCarouselSlider(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CustomButton(
                isNetwork: false,
                isRow: false,
                borderclr: Colors.transparent,
                color: Color.fromARGB(255, 207, 191, 49),
                fontweight: FontWeight.w700,
                height: 60,
                name: "Start Plan",
                radius: 10,
                textclr: Colors.black,
                textsize: 16,
                onTap: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
