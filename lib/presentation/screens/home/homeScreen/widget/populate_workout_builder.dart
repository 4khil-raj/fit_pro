import 'package:fit_pro/application/category_bloc/category_fetch_bloc.dart';
import 'package:fit_pro/application/exercises_fetch/exercisefetchbloc_bloc.dart';
import 'package:fit_pro/application/workout_fetch/workoutfetch_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

String exerciseGlobalId = '';
List exerciseList = [];
List circuitList = [];
List supersetList = [];

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
        if (state is DataState) {
          exerciseList = [];
          supersetList = [];
          circuitList = [];
          state.value.entries.forEach((entry) {
            String key = entry.key.trim().toLowerCase();

            if (key.contains('super') || key.contains('superset')) {
              supersetList.add(entry.value);
            } else if (key.contains('circuit') ||
                key.contains('circut') ||
                key.contains('hiit circuit')) {
              circuitList.add(entry.value);
            } else {
              exerciseList.add(entry.value);
            }
          });
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
            return exerciseContent(context, exercise[index]);
          },
        ),
      ],
    );
  }
}

exerciseContent(BuildContext context, Map<String, dynamic> exercise) {
  print(exerciseList.length);
  print('========-------------------==============---------------');
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
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(exercise['image_url'])),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    exercise['name'],
                    style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: const Color.fromARGB(255, 239, 236, 236)),
                  ),
                  Text(
                    '${exercise['sets']} Sets | ${exercise['set_time'] ?? ' '}',
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
