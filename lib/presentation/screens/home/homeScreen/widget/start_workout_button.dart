import 'package:fit_pro/application/category_bloc/category_fetch_bloc.dart';
import 'package:fit_pro/application/reps&weight/repsandweightworkout_bloc.dart';
import 'package:fit_pro/application/wokout_screen_buttons/workout_screen_buttons_bloc.dart';
import 'package:fit_pro/application/workout_fetch/workoutfetch_bloc.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/sub_pages/featured_plans/widgets/take_selfie.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/widget/populate_workout.dart';
import 'package:fit_pro/presentation/screens/start_workout/start_workout.dart';
import 'package:fit_pro/presentation/widgets/buttons/button.dart';
import 'package:fit_pro/presentation/widgets/custom_nav/customnav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StarWorkoutButtonInTW extends StatefulWidget {
  const StarWorkoutButtonInTW(
      {super.key, required this.stateValues, required this.index});
  final WorkoutFetchDone stateValues;
  final int index;

  @override
  State<StarWorkoutButtonInTW> createState() => _StarWorkoutButtonInTWState();
}

class _StarWorkoutButtonInTWState extends State<StarWorkoutButtonInTW> {
  bool endWorkout = false;
  @override
  Widget build(BuildContext context) {
    return endWorkout
        ? Expanded(
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: CustomButton(
                isNetwork: false,
                isRow: false,
                color: const Color.fromARGB(255, 244, 118, 118),
                borderclr: Color.fromARGB(255, 244, 118, 118),
                fontweight: FontWeight.w700,
                height: 50,
                name: "End Workout",
                radius: 10,
                textclr: Colors.black,
                textsize: 14,
                onTap: () async {
                  workoutyoutubePlayerController.pause();

                  categoryIdWorkout =
                      widget.stateValues.list[widget.index].categories[0];

                  customNavPush(context, const TakeSelfieScreen());

                  await Future.delayed(const Duration(seconds: 2));
                  setState(() {
                    endWorkout = false;
                  });
                },
              ),
            ),
          )
        : Expanded(
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: CustomButton(
                isNetwork: false,
                isRow: false,
                color: const Color.fromARGB(255, 219, 203, 59),
                borderclr: const Color.fromARGB(255, 179, 165, 41),
                fontweight: FontWeight.w700,
                height: 50,
                name: "Start Workout",
                radius: 10,
                textclr: Colors.black,
                textsize: 14,
                onTap: () {
                  workoutyoutubePlayerController.pause();

                  BlocProvider.of<RepsandweightworkoutBloc>(context)
                      .add(ClearList());
                  BlocProvider.of<WorkoutScreenButtonsBloc>(context)
                      .add(WorkoutScreenButtonsEvent());
                  categoryIdWorkout =
                      widget.stateValues.list[widget.index].categories[0];
                  BlocProvider.of<CategoryFetchBloc>(context).add(
                      CategoryFetchReq(
                          id: widget
                              .stateValues.list[widget.index].categories[0]));

                  // final response = await CategoryRepository()
                  //     .fetchCategories(
                  //         widget.stateValues.list[0].categories[0]);
                  // print('========+++++++++++--------');
                  // print(response[0].exercises[0].name);
                  customNavPush(context, const StartWorkoutScreen());
                  setState(() {
                    endWorkout = true;
                  });
                },
              ),
            ),
          );
  }
}
