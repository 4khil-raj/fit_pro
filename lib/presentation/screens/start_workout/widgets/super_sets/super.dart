import 'package:fit_pro/application/exercises_fetch/exercisefetchbloc_bloc.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/sub_pages/featured_plans/widgets/daily_task_builder.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/widget/populate_workout_builder.dart';
import 'package:fit_pro/presentation/screens/start_workout/widgets/super_sets/super_set.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SuperSetLunchScreen extends StatelessWidget {
  final String workoutID;
  const SuperSetLunchScreen({super.key, required this.workoutID});

  @override
  Widget build(BuildContext context) {
    if (supersetList != null) {
      // Print the exerciseList to debug
      print('exerciseList: $supersetList');

      // Flatten the exerciseList if it's a nested list
      for (var item in supersetList) {
        print('Item: $item'); // Print each item to check its type and contents
        if (item is Map<String, dynamic>) {
          flattenedSupersets.add(item);
        } else if (item is List) {
          // If item is a nested list, you may need to flatten further
          for (var subItem in item) {
            if (subItem is Map<String, dynamic>) {
              flattenedSupersets.add(subItem);
            }
          }
        }
      }
    } else {
      print('exerciseList is null');
    }
    // dayId == null
    //     ? BlocProvider.of<ExercisefetchblocBloc>(context)
    //         .add(ExerciseFetchRequestedEvent(workoutId: workoutID))
    //     : BlocProvider.of<ExercisefetchblocBloc>(context)
    //         .add(WorkoutInPlans(workoutId: dayId!));
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 6, 2, 19),
        body: BlocBuilder<ExercisefetchblocBloc, ExercisefetchblocState>(
          builder: (context, state) {
            if (state is DataState) {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return SuperSetScreen();
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
