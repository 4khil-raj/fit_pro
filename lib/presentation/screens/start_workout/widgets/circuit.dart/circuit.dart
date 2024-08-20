import 'package:fit_pro/application/category_bloc/category_fetch_bloc.dart';
import 'package:fit_pro/application/exercises_fetch/exercisefetchbloc_bloc.dart';
import 'package:fit_pro/application/superset_checker/supersetscreencheckbox_bloc.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/widget/populate_workout_builder.dart';
import 'package:fit_pro/presentation/screens/start_workout/widgets/carousel.dart';
import 'package:fit_pro/presentation/screens/start_workout/widgets/circuit.dart/checkbox.dart';
import 'package:fit_pro/presentation/screens/start_workout/widgets/lateral_burpee.dart';
import 'package:fit_pro/presentation/screens/start_workout/widgets/super_sets/buttons.dart';
import 'package:fit_pro/presentation/screens/start_workout/widgets/super_sets/super_set.dart';
import 'package:fit_pro/presentation/widgets/custom_nav/customnav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

// int j = 0;
List<Map<String, dynamic>> flattenedCircuits = [];

class CircuitScreenWorkouts extends StatelessWidget {
  CircuitScreenWorkouts({
    super.key,
  });
  // final SuccessState workoutState;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExercisefetchblocBloc, ExercisefetchblocState>(
      builder: (context, state) {
        if (state is DataState) {
          j = state.index ?? 0;
          if (coolDownList.isNotEmpty && flattenedCircuits.isEmpty) {
            BlocProvider.of<CategoryFetchBloc>(context)
                .add(NextWorkout(index: -1));
            BlocProvider.of<SupersetscreencheckboxBloc>(context)
                .add(ClearListt());
            //call exercise screen here with boolean
            WidgetsBinding.instance.addPostFrameCallback((_) {
              customNavReplacement(
                  context,
                  LateralBurpeeScreen(
                    coolDown: true,
                  ));
            });
            return SizedBox();
          } else if (flattenedCircuits.isEmpty) {
            Future.microtask(() => Navigator.pop(context));
            return SizedBox();
          }
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 6, 2, 19),
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              centerTitle: true,
              backgroundColor: const Color.fromARGB(255, 6, 2, 19),
              iconTheme: const IconThemeData(
                  color: Color.fromARGB(255, 255, 255, 255)),
              title: Column(
                children: [
                  Text(
                    flattenedCircuits[state.index ?? 0]['name'],
                    style: GoogleFonts.poppins(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '  Execise ${(j + 1)} of ${flattenedCircuits.length}',
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: const Color.fromARGB(255, 216, 210, 210),
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                CarouselForWorkout(
                  video: flattenedCircuits[state.index ?? 0]['video_url'],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: Text(
                        'Circuit',
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: Text(
                        '  Set Remaining ${(j + 1)}/${flattenedCircuits.length}',
                        style: GoogleFonts.poppins(
                            color: Colors.blue,
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                      ),
                    ),
                  ],
                ),
                CheckBoxRowCircuit(),
                Spacer(),
                SuperSetButtons(
                  valu: false,
                )
              ],
            ),
          );
        }
        return Scaffold(
            backgroundColor: const Color.fromARGB(255, 6, 2, 19),
            body: Center(
              child: LoadingAnimationWidget.dotsTriangle(
                  // secondRingColor: Colors.green,
                  // thirdRingColor: Colors.blue,
                  color: Color.fromARGB(255, 255, 255, 255),
                  size: 62),
            ));
      },
    );
  }
}
