// ignore_for_file: prefer_const_constructors

import 'package:fit_pro/application/plan_overview/plan_overview_bloc.dart';
import 'package:fit_pro/presentation/screens/bottom_nav/bottom_nav.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/sub_pages/featured_plans/widgets/planoverview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

late YoutubePlayerController planoverviewyoutubePlayerController;

class FeaturedPlanOverviewScreen extends StatefulWidget {
  const FeaturedPlanOverviewScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle,
      required this.task,
      required this.description,
      required this.video});
  final String image;
  final String title;
  final String subTitle;
  final String task;
  final String description;
  final String video;

  @override
  State<FeaturedPlanOverviewScreen> createState() =>
      _FeaturedPlanOverviewScreenState();
}

class _FeaturedPlanOverviewScreenState
    extends State<FeaturedPlanOverviewScreen> {
  final videourl = "https://youtu.be/eMjyvIQbn9M?si=3EntHPR3yGvnyBjl";

  @override
  void initState() {
    final videoId = YoutubePlayer.convertUrlToId(widget.video);
    planoverviewyoutubePlayerController = YoutubePlayerController(
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
      body: BlocBuilder<PlanOverviewBloc, PlanOverviewState>(
        builder: (context, state) {
          if (state is PlanFetchDone) {
            // WidgetsBinding.instance.addPostFrameCallback((_) {
            return PlanOverViewScreen(
              youtubePlayerController: planoverviewyoutubePlayerController,
              state: state,
            );
            // });
          }
          return Center(
              child: LoadingAnimationWidget.dotsTriangle(
                  // secondRingColor: Colors.green,
                  // thirdRingColor: Colors.blue,
                  color: Color.fromARGB(255, 255, 255, 255),
                  size: 62));
        },
      ),
    );
  }
}
