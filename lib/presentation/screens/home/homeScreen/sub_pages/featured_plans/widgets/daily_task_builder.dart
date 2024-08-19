import 'package:fit_pro/application/exercises_fetch/exercisefetchbloc_bloc.dart';
import 'package:fit_pro/application/plan_overview/plan_overview_bloc.dart';
import 'package:fit_pro/domain/models/exercise_fetch/model.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/sub_pages/featured_plans/widgets/task_view.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/widget/populate_workout_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

List<ExerciseSubClass> exerciseData = [];
String? dayId;

class DailyTaskBuilderScreen extends StatelessWidget {
  DailyTaskBuilderScreen(
      {super.key,
      // this.youtubePlayerController,
      required this.state,
      required this.weekIndex,
      required this.dayIndex,
      required this.superset});
  // final youtubePlayerController;
  final bool superset;
  final PlanFetchDone state;
  final int weekIndex;
  final int dayIndex;
  late YoutubePlayerController youtubePlayerController;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ExercisefetchblocBloc>(context).add(WorkoutInPlans(
        workoutId: state.list[0].weeks[weekIndex].days[dayIndex].id));
    dayId = state.list[0].weeks[weekIndex].days[dayIndex].id;
    return BlocBuilder<ExercisefetchblocBloc, ExercisefetchblocState>(
      builder: (context, state) {
        if (state is SuccessState) {
          exerciseData = state.exercises;
          List<ExerciseSubClass> allData = [
            ...state.exercises,
            ...state.superSet,
            ...state.circute
          ];
          return SizedBox(
            height:
                //  state.list[0].weeks[weekIndex].days[dayIndex].categories[0]
                //             .exercises.length ==
                //         1
                //     ? 100
                //     :
                400,
            child: ListView.builder(
                itemCount: allData.length,
                //  state.list[0].weeks[weekIndex].days[dayIndex]
                //     .categories[0].exercises.length,
                itemBuilder: (context, index) {
                  final videoId = YoutubePlayer.convertUrlToId(
                      // state
                      //   .list[0]
                      //   .weeks[weekIndex]
                      //   .days[dayIndex]
                      //   .categories[0]
                      //   .exercises[index]
                      //   .videoUrl

                      allData[index].videoUrl);
                  youtubePlayerController = YoutubePlayerController(
                      initialVideoId: videoId!,
                      flags: const YoutubePlayerFlags(autoPlay: false));
                  //       return
                  if (state.exercises.length == index &&
                      state.superSet.isNotEmpty) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Supersets',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
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
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  allData[index].imageUrl

                                                  // state
                                                  //   .list[0]
                                                  //   .weeks[weekIndex]
                                                  //   .days[dayIndex]
                                                  //   .categories[0]
                                                  //   .exercises[index]
                                                  //   .imageUrl

                                                  )),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: const Color.fromARGB(
                                              255, 0, 0, 0)),
                                      // child: YoutubePlayer(
                                      //   controller: youtubePlayerController,
                                      //   showVideoProgressIndicator: true,
                                      // ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          allData[index].name
                                          // state
                                          //     .list[0]
                                          //     .weeks[weekIndex]
                                          //     .days[dayIndex]
                                          //     .categories[0]
                                          //     .subCategory
                                          ,
                                          style: GoogleFonts.urbanist(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: const Color.fromARGB(
                                                  255, 239, 236, 236)),
                                        ),
                                        Text(
                                          // state
                                          //     .list[0]
                                          //     .weeks[weekIndex]
                                          //     .days[dayIndex]
                                          //     .categories[0]
                                          //     .exercises[index]
                                          //     .name,
                                          '${allData[index].sets}| ${allData[index].setTime}',
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
                        (state.exercises.length < index - 1)
                            ? Positioned(
                                top: 0,
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Transform.rotate(
                                    angle: 136 *
                                        3.1415926535 /
                                        180, // 90 degrees in radians
                                    child: FaIcon(
                                      FontAwesomeIcons.link,
                                      color: const Color.fromARGB(
                                          255, 163, 159, 159),
                                      size: 30.0,
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox()
                      ],
                    );
                  } else {
                    return Stack(children: [
                      Padding(
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
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                allData[index].imageUrl

                                                // state
                                                //   .list[0]
                                                //   .weeks[weekIndex]
                                                //   .days[dayIndex]
                                                //   .categories[0]
                                                //   .exercises[index]
                                                //   .imageUrl

                                                )),
                                        borderRadius: BorderRadius.circular(10),
                                        color:
                                            const Color.fromARGB(255, 0, 0, 0)),
                                    // child: YoutubePlayer(
                                    //   controller: youtubePlayerController,
                                    //   showVideoProgressIndicator: true,
                                    // ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                140,
                                        child: Text(
                                          allData[index].name
                                          // state
                                          //     .list[0]
                                          //     .weeks[weekIndex]
                                          //     .days[dayIndex]
                                          //     .categories[0]
                                          //     .subCategory
                                          ,
                                          style: GoogleFonts.urbanist(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: const Color.fromARGB(
                                                  255, 239, 236, 236)),
                                        ),
                                      ),
                                      Text(
                                        // state
                                        //     .list[0]
                                        //     .weeks[weekIndex]
                                        //     .days[dayIndex]
                                        //     .categories[0]
                                        //     .exercises[index]
                                        //     .name,
                                        '${allData[index].sets} Sets | ${allData[index].setTime}',
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
                      (state.exercises.length < index)
                          ? Positioned(
                              top: 0,
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Transform.rotate(
                                  angle: 136 *
                                      3.1415926535 /
                                      180, // 90 degrees in radians
                                  child: FaIcon(
                                    FontAwesomeIcons.link,
                                    color: const Color.fromARGB(
                                        255, 163, 159, 159),
                                    size: 30.0,
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox()
                    ]);
                  }
                }),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
