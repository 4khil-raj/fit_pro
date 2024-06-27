import 'package:fit_pro/presentation/screens/home/homeScreen/sub_pages/featured_plans/widgets/task_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DailyTaskBuilderScreen extends StatelessWidget {
  const DailyTaskBuilderScreen({super.key, this.youtubePlayerController});
  final youtubePlayerController;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () => taskViewSheet(context, youtubePlayerController),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 42, 41, 41),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.amber),
                          child: YoutubePlayer(
                            controller: youtubePlayerController,
                            showVideoProgressIndicator: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Lateral Burpee",
                              style: GoogleFonts.urbanist(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 239, 236, 236)),
                            ),
                            Text(
                              "4 Sets | 25 sec",
                              style: GoogleFonts.urbanist(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 186, 178, 178)),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
