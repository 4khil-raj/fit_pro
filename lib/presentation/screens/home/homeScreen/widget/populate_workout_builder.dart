import 'package:fit_pro/application/category_bloc/category_fetch_bloc.dart';
import 'package:fit_pro/application/exercises_fetch/exercisefetchbloc_bloc.dart';
import 'package:fit_pro/application/reps&weight/repsandweightworkout_bloc.dart';
import 'package:fit_pro/application/wokout_screen_buttons/workout_screen_buttons_bloc.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/sub_pages/featured_plans/widgets/task_view.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/widget/populate_workout.dart';
import 'package:fit_pro/presentation/screens/start_workout/widgets/lateral_burpee.dart';
import 'package:fit_pro/presentation/screens/start_workout/widgets/super_sets/super.dart';
import 'package:fit_pro/presentation/widgets/custom_nav/customnav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

String exerciseGlobalId = '';
List exerciseList = [];
List circuitList = [];
List supersetList = [];
List coolDownList = [];

class PopulateTaskBuilderScreen extends StatelessWidget {
  PopulateTaskBuilderScreen({
    required this.isWorkout,
    required this.workout,
    super.key,
    required this.Id,
  });
  final String Id;
  final bool isWorkout;
  late YoutubePlayerController youtubePlayerController;
  final bool workout;

  @override
  Widget build(BuildContext context) {
    exerciseGlobalId = Id;
    workout
        ? BlocProvider.of<ExercisefetchblocBloc>(context)
            .add(ExerciseFetchRequestedEvent(workoutId: Id))
        : BlocProvider.of<ExercisefetchblocBloc>(context)
            .add(WorkoutInPlans(workoutId: Id
                //  state.list[0].weeks[weekIndex].days[dayIndex].id
                ));
    // BlocProvider.of<CategoryFetchBloc>(context)
    //     .add(CategoryFetchReq(id: stateValues.list[dayIndex].categories[0])); nthelum error akuvane ee id koduthittolla valuene passcheyyippikkanam

    return BlocBuilder<ExercisefetchblocBloc, ExercisefetchblocState>(
      builder: (context, state) {
        if (state is DataState) {
          exerciseList = [];
          supersetList = [];
          circuitList = [];
          coolDownList = [];
          state.value.entries.forEach((entry) {
            String key = entry.key.trim().toLowerCase();

            if (key.contains('super') || key.contains('superset')) {
              supersetList.add(entry.value);
            } else if (key.contains('circuit') ||
                key.contains('circut') ||
                key.contains('hiit circuit')) {
              circuitList.add(entry.value);
            } else if (key.contains('cool') ||
                key.contains('cooldown') ||
                key.contains('cool down')) {
              coolDownList.add(entry.value);
            } else {
              exerciseList.add(entry.value);
            }
          });
          if (circuitList.isEmpty && supersetList.isEmpty) {
            exerciseList.addAll(coolDownList);
            coolDownList = [];
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: state.value.entries.map((entry) {
              return buildTaskTile(entry.value, context, entry.key);
            }).toList(),
          );
        }
        return const Center(
            child: CircularProgressIndicator(
          color: Colors.amber,
        ));
      },
    );
  }

  Widget buildTaskTile(
      List<dynamic> exercise, BuildContext context, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: GoogleFonts.poppins(
                color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
        ListView.builder(
          shrinkWrap: true, // Adjusts to the content's height
          physics:
              NeverScrollableScrollPhysics(), // Disables internal scrolling
          itemCount: exercise.length,
          itemBuilder: (context, index) {
            return exerciseContent(context, exercise[index], title, index,
                exercise.length, isWorkout);
          },
        ),
      ],
    );
  }
}

Widget exerciseContent(BuildContext context, Map<String, dynamic> exercise,
    String title, int index, int totalCount, bool isWorkout) {
  bool isCircuitOrSuperset = title.toLowerCase().contains('circuit') ||
      title.toLowerCase().contains('superset');

  bool shouldShowIcon = isCircuitOrSuperset &&
      index % 2 ==
          0 && // Only show on odd tiles (0-based index, so 0, 2, 4, ...)
      index + 1 < totalCount; // Ensure there is a next tile to pair with

  return InkWell(
    onTap: () {
      bool isCircuit = title.toLowerCase().contains('circuit');
      bool isSuperset = title.toLowerCase().contains('superset');
      bool isCool = title.toLowerCase().contains('cool');
      if (isWorkout) {
        if (isCool) {
          coolDwonscre(context, index);
        } else if (isSuperset) {
          supersetScre(context, index);
        } else if (isCircuit) {
          cicuitScreengo(context, index);
        } else {
          workoutScreen(context, index, exercise['_id']);
        }
      } else {
        taskViewSheet(
            context, exercise['video_url'], exercise['name'], exercise['']);
      }
    },
    child: Padding(
      padding: EdgeInsets.only(
          left: 8.0, right: 8.0, top: 8.0, bottom: shouldShowIcon ? 0 : 8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 42, 41, 41),
              borderRadius: BorderRadius.circular(10),
            ),
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
                        image: NetworkImage(exercise['image_url']),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        exercise['name'],
                        style: GoogleFonts.urbanist(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: const Color.fromARGB(255, 239, 236, 236),
                        ),
                      ),
                      Text(
                        '${exercise['sets']} Sets | ${exercise['set_time'] != null && exercise['set_time'].isNotEmpty ? exercise['set_time'] : '45 Seconds'}',
                        style: GoogleFonts.urbanist(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: const Color.fromARGB(255, 186, 178, 178),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (shouldShowIcon)
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Transform.rotate(
                  angle: 136 * 3.1415926535 / 180, // 136 degrees in radians
                  child: FaIcon(
                    FontAwesomeIcons.link,
                    color: const Color.fromARGB(255, 163, 159, 159),
                    size: 20.0,
                  ),
                ),
              ),
            ),
        ],
      ),
    ),
  );
}

String workoutIDq = '';

workoutScreen(context, index, String id) {
  workoutIDq = id;
  workoutyoutubePlayerController.pause();

  BlocProvider.of<RepsandweightworkoutBloc>(context).add(ClearList());
  BlocProvider.of<WorkoutScreenButtonsBloc>(context)
      .add(WorkoutScreenButtonsEvent());
  // categoryIdWorkout = categoryIdWorkout;

  BlocProvider.of<CategoryFetchBloc>(context)
      .add(NextWorkoutEvent(index: index - 1));

  // final response = await CategoryRepository()
  //     .fetchCategories(
  //         widget.stateValues.list[0].categories[0]);
  // print('========+++++++++++--------');
  // print(response[0].exercises[0].name);
  customNavPush(
      context,
      LateralBurpeeScreen(
        workout: true,
        coolDown: false,
      ));
}
// void workoutScreen(BuildContext context, int index, String id) {
//   workoutIDq = id;
//   workoutyoutubePlayerController.pause();

//   // Adjust the index by decrementing it by 1, similar to other methods
//   index = index - 1;

//   BlocProvider.of<RepsandweightworkoutBloc>(context).add(ClearList());
//   BlocProvider.of<WorkoutScreenButtonsBloc>(context)
//       .add(WorkoutScreenButtonsEvent());

//   BlocProvider.of<CategoryFetchBloc>(context)
//       .add(NextWorkoutEvent(index: index));

//   customNavPush(
//     context,
//     LateralBurpeeScreen(
//       workout: true,
//       coolDown: false,
//     ),
//   );
// }

void supersetScre(context, index) {
  BlocProvider.of<ExercisefetchblocBloc>(context).add(NextWorkouts(
      index:
          //  index == 0 ? index :
          index - 1));
  customNavPush(context, SuperSetLunchScreen(workoutID: ''));
  ;
}

void cicuitScreengo(context, index) {
  BlocProvider.of<ExercisefetchblocBloc>(context)
      .add(NextWorkouts(index: index - 1));
  customNavPush(
      context,
      SuperSetLunchScreen(
        workoutID: '',
      ));
}

void coolDwonscre(context, index) {
  BlocProvider.of<RepsandweightworkoutBloc>(context).add(ClearList());
  BlocProvider.of<WorkoutScreenButtonsBloc>(context)
      .add(WorkoutScreenButtonsEvent());
  BlocProvider.of<CategoryFetchBloc>(context)
      .add(NextWorkoutEvent(index: index - 1));
  customNavPush(
      context,
      LateralBurpeeScreen(
        workout: false,
        coolDown: true,
      ));
}
