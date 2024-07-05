// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fit_pro/application/start_workout/start_workout_bloc.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/sub_pages/featured_plans/widgets/daily_task_builder.dart';
import 'package:fit_pro/presentation/screens/home/progress/widget/plan_progress/widget/buttons.dart';
import 'package:fit_pro/presentation/screens/home/progress/widget/plan_progress/widget/challenge_text.dart';
import 'package:fit_pro/presentation/screens/home/progress/widget/plan_progress/widget/redo_screen.dart';
import 'package:fit_pro/presentation/screens/home/progress/widget/plan_progress/widget/top_image.dart';
import 'package:fit_pro/presentation/screens/home/progress/widget/plan_progress/widget/week_calender.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlanProgressScreen extends StatefulWidget {
  const PlanProgressScreen({super.key});

  @override
  State<PlanProgressScreen> createState() => _PlanProgressScreenState();
}

class _PlanProgressScreenState extends State<PlanProgressScreen> {
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

  bool value = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StartWorkoutBloc, StartWorkoutState>(
      builder: (context, state) {
        if (state is RedoWorkout) {
          value = state.value;
        }
        return SingleChildScrollView(
          child: Column(
            children: [
              PlanProgressTopImage(),
              PlanProgressWeekCalender(),
              ChallengeTextProgressScreen(),
              value
                  ? RedoWorkoutScreen()
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.alarm,
                            color: Color.fromARGB(255, 92, 233, 248),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Set Reminder",
                            style: GoogleFonts.poppins(
                                color: Color.fromARGB(255, 92, 233, 248),
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
              value
                  ? SizedBox()
                  : SizedBox(
                      height: 400,
                      child: DailyTaskBuilderScreen(
                        youtubePlayerController: youtubePlayerController,
                      ),
                    ),
              PlanProgressScreenButtons(
                value: value,
              )
            ],
          ),
        );
      },
    );
  }
}
