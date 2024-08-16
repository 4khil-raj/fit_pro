import 'package:fit_pro/application/category_bloc/category_fetch_bloc.dart';
import 'package:fit_pro/application/exercises_fetch/exercisefetchbloc_bloc.dart';
import 'package:fit_pro/presentation/screens/start_workout/widgets/carousel.dart';
import 'package:fit_pro/presentation/screens/start_workout/widgets/circuit.dart/checkbox.dart';
import 'package:fit_pro/presentation/screens/start_workout/widgets/super_sets/buttons.dart';
import 'package:fit_pro/presentation/screens/start_workout/widgets/super_sets/check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

// int j = 0;

class CircuitScreenWorkouts extends StatelessWidget {
  CircuitScreenWorkouts({super.key, required this.workoutState});
  final SuccessState workoutState;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExercisefetchblocBloc, ExercisefetchblocState>(
      builder: (context, state) {
        if (state is SuccessState) {
          if (state.circute.isEmpty) {
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
                    state.circute[state.index].name,
                    style: GoogleFonts.poppins(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '  Execise ${state.circute[state.index].exerciseNumber} of ${state.circute.length}',
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
                  video: state.circute[state.index].videoUrl,
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
                        '  Set Remaining ${state.circute[state.index].exerciseNumber}/${state.circute.length}',
                        style: GoogleFonts.poppins(
                            color: Colors.blue,
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                      ),
                    ),
                  ],
                ),
                CheckBoxRowCircuit(
                  workoutState: state,
                ),
                Spacer(),
                SuperSetButtons(
                  workoutState: workoutState,
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
