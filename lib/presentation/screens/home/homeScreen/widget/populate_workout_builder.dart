import 'package:fit_pro/application/category_bloc/category_fetch_bloc.dart';
import 'package:fit_pro/application/workout_fetch/workoutfetch_bloc.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/sub_pages/featured_plans/widgets/task_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PopulateTaskBuilderScreen extends StatelessWidget {
  PopulateTaskBuilderScreen(
      {super.key,
      // this.youtubePlayerController,
      required this.stateValues,
      required this.dayIndex,
      required this.superset});
  // final youtubePlayerController;
  final WorkoutFetchDone stateValues;
  final bool superset;
  final int dayIndex;
  late YoutubePlayerController youtubePlayerController;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CategoryFetchBloc>(context)
        .add(CategoryFetchReq(id: stateValues.list[dayIndex].categories[0]));
    return BlocBuilder<CategoryFetchBloc, CategoryFetchState>(
      builder: (context, state) {
        if (state is CategoryFetched) {
          // return SizedBox(
          //   height: 250,
          //   child: ListView.builder(
          //       itemCount: state.list[0].exercises.length,
          //       itemBuilder: (context, index) {
          final videoId =
              YoutubePlayer.convertUrlToId(state.list[0].exercises[0].videoUrl);
          youtubePlayerController = YoutubePlayerController(
              initialVideoId: videoId!,
              flags: const YoutubePlayerFlags(autoPlay: false));
          return Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(7.0),
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
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          state.list[0].exercises[0].imageUrl)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                // child:

                                //  YoutubePlayer(
                                //   controller: youtubePlayerController,
                                //   showVideoProgressIndicator: true,
                                // ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.list[0].exercises[0].name,
                                    style: GoogleFonts.urbanist(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: const Color.fromARGB(
                                            255, 239, 236, 236)),
                                  ),
                                  Text(
                                    state.list[0].exercises[0].exerciseType,
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
                  ),
                  Padding(
                    padding: const EdgeInsets.all(7.0),
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
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(state
                                            .list[0].exercises[1].imageUrl)),
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.amber),
                                // child: YoutubePlayer(
                                //   controller: youtubePlayerController,
                                //   showVideoProgressIndicator: true,
                                // ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.list[0].exercises[1].name,
                                    style: GoogleFonts.urbanist(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: const Color.fromARGB(
                                            255, 239, 236, 236)),
                                  ),
                                  Text(
                                    state.list[0].exercises[1].exerciseType,
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
                  ),
                ],
              ),
              superset
                  ? Positioned(
                      top: 0,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Center(
                          child: Transform.rotate(
                        angle:
                            136 * 3.1415926535 / 180, // 90 degrees in radians
                        child: FaIcon(
                          FontAwesomeIcons.link,
                          color: const Color.fromARGB(255, 163, 159, 159),
                          size: 30.0,
                        ),
                      )),
                    )
                  : const SizedBox(),
            ],
          );
          //       }),
          // );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
