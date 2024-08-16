import 'package:fit_pro/application/category_bloc/category_fetch_bloc.dart';
import 'package:fit_pro/application/exercises_fetch/exercisefetchbloc_bloc.dart';
import 'package:fit_pro/application/superset_checker/supersetscreencheckbox_bloc.dart';
import 'package:fit_pro/application/workout_fetch/workoutfetch_bloc.dart';
import 'package:fit_pro/domain/models/exercise_fetch/model.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/sub_pages/featured_plans/widgets/task_view.dart';
import 'package:fit_pro/presentation/screens/start_workout/widgets/super_sets/super.dart';
import 'package:fit_pro/presentation/widgets/custom_nav/customnav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// String exerciseGlobalId = '';

// class PopulateTaskBuilderScreen extends StatelessWidget {
//   PopulateTaskBuilderScreen(
//       {super.key,
//       // this.youtubePlayerController,
//       required this.stateValues,
//       required this.dayIndex,
//       required this.superset});
//   // final youtubePlayerController;
//   final WorkoutFetchDone stateValues;
//   final bool superset;
//   final int dayIndex;
//   late YoutubePlayerController youtubePlayerController;

//   @override
//   Widget build(BuildContext context) {
//     exerciseGlobalId = stateValues.list[dayIndex].id;
//     BlocProvider.of<ExercisefetchblocBloc>(context).add(
//         ExerciseFetchRequestedEvent(workoutId: stateValues.list[dayIndex].id));
//     BlocProvider.of<CategoryFetchBloc>(context)
//         .add(CategoryFetchReq(id: stateValues.list[dayIndex].categories[0]));
//     return BlocBuilder<ExercisefetchblocBloc, ExercisefetchblocState>(
//       builder: (context, state) {
//         if (state is SuccessState) {
//           List<ExerciseSubClass> allData = [
//             ...state.exercises,
//             ...state.superSet,
//             ...state.circute
//           ];
//           return SizedBox(
//             height: 400,
//             child: ListView.builder(
//                 itemCount:
//                     //  state.list[0].exercises.length

//                     // allData.length,
//                     state.exercises.length +
//                         state.superSet.length +
//                         state.circute.length,
//                 itemBuilder: (context, index) {
//                   if (state.exercises.length == index) {
//                     return Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             'Supersets',
//                             style: GoogleFonts.poppins(
//                                 color: Colors.white,
//                                 fontSize: 17,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: InkWell(
//                             onTap: () =>
//                                 taskViewSheet(context, youtubePlayerController),
//                             child: Container(
//                               decoration: BoxDecoration(
//                                   color: const Color.fromARGB(255, 42, 41, 41),
//                                   borderRadius: BorderRadius.circular(10)),
//                               child: Row(
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.all(11.0),
//                                     child: Container(
//                                       clipBehavior: Clip.antiAlias,
//                                       height: 80,
//                                       width: 80,
//                                       decoration: BoxDecoration(
//                                           image: DecorationImage(
//                                               fit: BoxFit.cover,
//                                               image: NetworkImage(
//                                                   allData[index].imageUrl

//                                                   // state
//                                                   //   .list[0]
//                                                   //   .weeks[weekIndex]
//                                                   //   .days[dayIndex]
//                                                   //   .categories[0]
//                                                   //   .exercises[index]
//                                                   //   .imageUrl

//                                                   )),
//                                           borderRadius:
//                                               BorderRadius.circular(10),
//                                           color: Colors.amber),
//                                       // child: YoutubePlayer(
//                                       //   controller: youtubePlayerController,
//                                       //   showVideoProgressIndicator: true,
//                                       // ),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.all(10.0),
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           allData[index].name
//                                           // state
//                                           //     .list[0]
//                                           //     .weeks[weekIndex]
//                                           //     .days[dayIndex]
//                                           //     .categories[0]
//                                           //     .subCategory
//                                           ,
//                                           style: GoogleFonts.urbanist(
//                                               fontWeight: FontWeight.bold,
//                                               fontSize: 16,
//                                               color: const Color.fromARGB(
//                                                   255, 239, 236, 236)),
//                                         ),
//                                         Text(
//                                           // state
//                                           //     .list[0]
//                                           //     .weeks[weekIndex]
//                                           //     .days[dayIndex]
//                                           //     .categories[0]
//                                           //     .exercises[index]
//                                           //     .name,
//                                           allData[index].weighted,
//                                           style: GoogleFonts.urbanist(
//                                               fontWeight: FontWeight.bold,
//                                               fontSize: 14,
//                                               color: const Color.fromARGB(
//                                                   255, 186, 178, 178)),
//                                         ),
//                                       ],
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                         (state.exercises.length < index - 1)
//                             ? Positioned(
//                                 top: 0,
//                                 bottom: 0,
//                                 left: 0,
//                                 right: 0,
//                                 child: Align(
//                                   alignment: Alignment.bottomCenter,
//                                   child: Transform.rotate(
//                                     angle: 136 *
//                                         3.1415926535 /
//                                         180, // 90 degrees in radians
//                                     child: FaIcon(
//                                       FontAwesomeIcons.link,
//                                       color: const Color.fromARGB(
//                                           255, 163, 159, 159),
//                                       size: 30.0,
//                                     ),
//                                   ),
//                                 ),
//                               )
//                             : const SizedBox()
//                       ],
//                     );
//                   } else {
//                     // final videoId =
//                     //     YoutubePlayer.convertUrlToId(state.list[0].exercises[0].videoUrl);
//                     // youtubePlayerController = YoutubePlayerController(
//                     //     initialVideoId: videoId!,
//                     //     flags: const YoutubePlayerFlags(autoPlay: false));
//                     return Stack(
//                       children: [
//                         Column(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.all(7.0),
//                               child: InkWell(
//                                 onTap: () {
//                                   BlocProvider.of<SupersetscreencheckboxBloc>(
//                                           context)
//                                       .add(ClearListt());
//                                   state.exercises.length < index
//                                       ? customNavPush(
//                                           context,
//                                           SuperSetLunchScreen(
//                                             workoutID:
//                                                 stateValues.list[dayIndex].id,
//                                           ))
//                                       : taskViewSheet(
//                                           context, youtubePlayerController);
//                                 },
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                       color:
//                                           const Color.fromARGB(255, 42, 41, 41),
//                                       borderRadius: BorderRadius.circular(10)),
//                                   child: Row(
//                                     children: [
//                                       Padding(
//                                         padding: const EdgeInsets.all(11.0),
//                                         child: Container(
//                                           clipBehavior: Clip.antiAlias,
//                                           height: 80,
//                                           width: 80,
//                                           decoration: BoxDecoration(
//                                             image: DecorationImage(
//                                                 fit: BoxFit.cover,
//                                                 image: NetworkImage(
//                                                     // state.list[0].exercises[0].imageUrl
//                                                     allData[index].imageUrl)),
//                                             borderRadius:
//                                                 BorderRadius.circular(10),
//                                           ),
//                                           // child:

//                                           //  YoutubePlayer(
//                                           //   controller: youtubePlayerController,
//                                           //   showVideoProgressIndicator: true,
//                                           // ),
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.all(10.0),
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                               // state.list[0].exercises[0].name,
//                                               allData[index].name,
//                                               style: GoogleFonts.urbanist(
//                                                   fontWeight: FontWeight.bold,
//                                                   fontSize: 16,
//                                                   color: const Color.fromARGB(
//                                                       255, 239, 236, 236)),
//                                             ),
//                                             Text(
//                                               // state.list[0].exercises[0]
//                                               //     .exerciseType,
//                                               allData[index].exerciseType,
//                                               style: GoogleFonts.urbanist(
//                                                   fontWeight: FontWeight.bold,
//                                                   fontSize: 14,
//                                                   color: const Color.fromARGB(
//                                                       255, 186, 178, 178)),
//                                             ),
//                                           ],
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         (index > state.exercises.length)
//                             ? Positioned(
//                                 top: 0,
//                                 bottom: 0,
//                                 left: 0,
//                                 right: 0,
//                                 child: Align(
//                                   alignment: Alignment.topCenter,
//                                   child: Transform.rotate(
//                                     angle: 136 *
//                                         3.1415926535 /
//                                         180, // 90 degrees in radians
//                                     child: FaIcon(
//                                       FontAwesomeIcons.link,
//                                       color: const Color.fromARGB(
//                                           255, 163, 159, 159),
//                                       size: 30.0,
//                                     ),
//                                   ),
//                                 ),
//                               )
//                             : const SizedBox(),
//                       ],
//                     );
//                   }
//                 }),
//           );
//         }
//         return Center(child: CircularProgressIndicator());
//       },
//     );
//   }
// }
// import 'package:fit_pro/domain/models/exercise_fetch/model.dart';
// import 'package:fit_pro/presentation/screens/home/homeScreen/sub_pages/featured_plans/widgets/task_view.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// Assume other imports are here...

String exerciseGlobalId = '';

class PopulateTaskBuilderScreen extends StatelessWidget {
  PopulateTaskBuilderScreen(
      {super.key,
      required this.stateValues,
      required this.dayIndex,
      required this.superset});
  final WorkoutFetchDone stateValues;
  final bool superset;
  final int dayIndex;
  late YoutubePlayerController youtubePlayerController;

  @override
  Widget build(BuildContext context) {
    exerciseGlobalId = stateValues.list[dayIndex].id;
    BlocProvider.of<ExercisefetchblocBloc>(context).add(
        ExerciseFetchRequestedEvent(workoutId: stateValues.list[dayIndex].id));
    BlocProvider.of<CategoryFetchBloc>(context)
        .add(CategoryFetchReq(id: stateValues.list[dayIndex].categories[0]));
    return BlocBuilder<ExercisefetchblocBloc, ExercisefetchblocState>(
      builder: (context, state) {
        if (state is SuccessState) {
          List<ExerciseSubClass> allData = [
            ...state.exercises,
            ...state.superSet,
            ...state.circute
          ];
          return SizedBox(
            height: 450,
            child: ListView.builder(
                itemCount: state.exercises.length +
                    state.superSet.length +
                    state.circute.length +
                    1, // Adding 1 for the "Supersets" text
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Exercises',
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    );
                  } else if (index < state.exercises.length) {
                    // Exercises section
                    return buildTaskTile(allData[index], context);
                  } else if (index == state.exercises.length &&
                      state.superSet.isNotEmpty) {
                    // Supersets header
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Supersets',
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    );
                  } else if (index == state.exercises.length ||
                      index == state.superSet.length &&
                          state.circute.isNotEmpty) {
                    // Supersets header
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Circuit',
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    );
                  } else {
                    // Supersets and Circuits section
                    int adjustedIndex = index - state.exercises.length - 1;

                    if (adjustedIndex < state.superSet.length) {
                      // Supersets logic with link icons
                      return Stack(
                        children: [
                          buildTaskTile(
                              allData[state.exercises.length + adjustedIndex],
                              context),
                          if (adjustedIndex
                              .isOdd) // Connect odd and even tiles with link icon
                            Positioned(
                              top: 0,
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Transform.rotate(
                                  angle: 136 * 3.1415926535 / 180,
                                  child: FaIcon(
                                    FontAwesomeIcons.link,
                                    color: const Color.fromARGB(
                                        255, 163, 159, 159),
                                    size: 30.0,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      );
                    } else {
                      // Circuit section
                      int circuitIndex = adjustedIndex - state.superSet.length;
                      return buildTaskTile(
                          allData[state.exercises.length +
                              state.superSet.length +
                              circuitIndex],
                          context);
                    }
                  }
                }),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget buildTaskTile(ExerciseSubClass exercise, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => taskViewSheet(context, youtubePlayerController),
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
                          image: NetworkImage(exercise.imageUrl)),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      exercise.name,
                      style: GoogleFonts.urbanist(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: const Color.fromARGB(255, 239, 236, 236)),
                    ),
                    Text(
                      exercise.exerciseType,
                      style: GoogleFonts.urbanist(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: const Color.fromARGB(255, 186, 178, 178)),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
