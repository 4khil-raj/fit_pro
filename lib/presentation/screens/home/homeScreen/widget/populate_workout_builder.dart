import 'package:fit_pro/application/category_bloc/category_fetch_bloc.dart';
import 'package:fit_pro/application/plan_overview/plan_overview_bloc.dart';
import 'package:fit_pro/application/workout_fetch/workoutfetch_bloc.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/sub_pages/featured_plans/widgets/task_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PopulateTaskBuilderScreen extends StatelessWidget {
  PopulateTaskBuilderScreen(
      {super.key,
      // this.youtubePlayerController,
      required this.stateValues,
      required this.dayIndex});
  // final youtubePlayerController;
  final WorkoutFetchDone stateValues;
  final int dayIndex;
  late YoutubePlayerController youtubePlayerController;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CategoryFetchBloc>(context)
        .add(CategoryFetchReq(id: stateValues.list[dayIndex].categories[0]));
    return BlocBuilder<CategoryFetchBloc, CategoryFetchState>(
      builder: (context, state) {
        if (state is CategoryFetched) {
          return Expanded(
            child: ListView.builder(
                itemCount: state.list[0].exercises.length,
                itemBuilder: (context, index) {
                  final videoId = YoutubePlayer.convertUrlToId(
                      state.list[0].exercises[index].videoUrl);
                  youtubePlayerController = YoutubePlayerController(
                      initialVideoId: videoId!,
                      flags: const YoutubePlayerFlags(autoPlay: false));
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () =>
                          taskViewSheet(context, youtubePlayerController),
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
                                    state.list[0].exercises[index].name,
                                    style: GoogleFonts.urbanist(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: const Color.fromARGB(
                                            255, 239, 236, 236)),
                                  ),
                                  Text(
                                    state.list[0].exercises[index].exerciseType,
                                    style: GoogleFonts.urbanist(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: const Color.fromARGB(
                                            255, 186, 178, 178)),
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
        return CircularProgressIndicator();
      },
    );
  }
}
