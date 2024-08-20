import 'package:fit_pro/application/category_bloc/category_fetch_bloc.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/sub_pages/featured_plans/widgets/task_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DailyTaskBuilderBookmarkScreen extends StatelessWidget {
  DailyTaskBuilderBookmarkScreen({
    super.key,
    required this.bookmarkIndex,
    // this.youtubePlayerController,
  });
  // final youtubePlayerController;

  late YoutubePlayerController youtubePlayerController;
  final int bookmarkIndex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: categorylist![0].exercises.length,
          itemBuilder: (context, index) {
            final videoId = YoutubePlayer.convertUrlToId(
                categorylist![index].exercises[index].videoUrl);
            youtubePlayerController = YoutubePlayerController(
                initialVideoId: videoId!,
                flags: const YoutubePlayerFlags(autoPlay: false));
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                // onTap: () => taskViewSheet(context, youtubePlayerController),
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 42, 41, 41),
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
                              categorylist![index].subCategory,
                              style: GoogleFonts.urbanist(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color:
                                      const Color.fromARGB(255, 239, 236, 236)),
                            ),
                            Text(
                              categorylist![index].exercises[index].name,
                              style: GoogleFonts.urbanist(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color:
                                      const Color.fromARGB(255, 186, 178, 178)),
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
