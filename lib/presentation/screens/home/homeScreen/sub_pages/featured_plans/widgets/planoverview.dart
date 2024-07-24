import 'package:fit_pro/application/plan_overview/plan_overview_bloc.dart';

import 'package:fit_pro/presentation/screens/home/homeScreen/sub_pages/featured_plans/widgets/week1_carosel.dart';
import 'package:fit_pro/presentation/widgets/buttons/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlanOverViewScreen extends StatelessWidget {
  const PlanOverViewScreen(
      {super.key, required this.youtubePlayerController, required this.state});
  final YoutubePlayerController youtubePlayerController;
  final PlanFetchDone state;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          YoutubePlayer(
            controller: youtubePlayerController,
            showVideoProgressIndicator: true,
          ),
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.list[0].planName,
                  style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: const Color.fromARGB(255, 92, 178, 248)),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  state.list[0].trainingType,
                  style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: const Color.fromARGB(255, 255, 255, 255)),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    state.list[0].planName,
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: const Color.fromARGB(255, 219, 213, 213)),
                  ),
                ),
                const SizedBox(
                  height: 9,
                ),
                Text(
                  state.list[0].description,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 210, 205, 205)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 410,
            child: ListView.builder(
                itemCount: state.list[0].weeks.length,
                itemBuilder: (context, index) {
                  return WeekOneCarouselSlider(
                    index: index,
                    state: state,
                  );
                }),
          ),
          // WeekTwoCarouselSlider(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: CustomButton(
              isNetwork: false,
              isRow: false,
              borderclr: Colors.transparent,
              color: const Color.fromARGB(255, 207, 191, 49),
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
    );
  }
}
