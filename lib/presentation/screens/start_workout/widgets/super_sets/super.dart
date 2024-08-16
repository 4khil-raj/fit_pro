import 'package:fit_pro/application/exercises_fetch/exercisefetchbloc_bloc.dart';
import 'package:fit_pro/presentation/screens/start_workout/widgets/super_sets/super_set.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SuperSetLunchScreen extends StatelessWidget {
  final String workoutID;
  const SuperSetLunchScreen({super.key, required this.workoutID});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ExercisefetchblocBloc>(context)
        .add(ExerciseFetchRequestedEvent(workoutId: workoutID));
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 6, 2, 19),
        body: BlocBuilder<ExercisefetchblocBloc, ExercisefetchblocState>(
          builder: (context, state) {
            if (state is SuccessState) {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return SuperSetScreen(workoutState: state);
                }));
              });
            } else if (state is ErrorState) {
              print(state.msg);
            } else if (state is ExercisefetchblocInitial) {
              return Center(
                  child: LoadingAnimationWidget.dotsTriangle(
                      // secondRingColor: Colors.green,
                      // thirdRingColor: Colors.blue,
                      color: Color.fromARGB(255, 255, 255, 255),
                      size: 62));
            }
            return Center(
                child: LoadingAnimationWidget.dotsTriangle(
                    // secondRingColor: Colors.green,
                    // thirdRingColor: Colors.blue,
                    color: Color.fromARGB(255, 255, 255, 255),
                    size: 62));
          },
        ));
  }
}
