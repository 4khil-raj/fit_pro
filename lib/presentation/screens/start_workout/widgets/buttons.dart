import 'dart:async';

import 'package:fit_pro/application/category_bloc/category_fetch_bloc.dart';
import 'package:fit_pro/application/reps&weight/repsandweightworkout_bloc.dart';
import 'package:fit_pro/application/superSetButtons/superset_buttons_bloc.dart';
import 'package:fit_pro/application/wokout_screen_buttons/workout_screen_buttons_bloc.dart';
import 'package:fit_pro/infrastructure/repository/temp_category/temp.dart';
import 'package:fit_pro/presentation/screens/start_workout/widgets/lateral_burpee.dart';
import 'package:fit_pro/presentation/screens/start_workout/widgets/super_sets/super_set.dart';
import 'package:fit_pro/presentation/widgets/custom_nav/customnav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

final StopWatchTimer stopWatchTimer = StopWatchTimer();

class TickButtonForLateralBurpee extends StatefulWidget {
  const TickButtonForLateralBurpee({super.key, required this.categoryState});
  final CategoryFetched categoryState;

  @override
  State<TickButtonForLateralBurpee> createState() =>
      _TickButtonForLateralBurpeeState();
}

class _TickButtonForLateralBurpeeState
    extends State<TickButtonForLateralBurpee> {
  bool button = true;
  @override
  Widget build(BuildContext context) {
    return
        // categoryforWorkout.contains(widget.categoryState.list[0].id)
        //     ? Container(
        //         width: double.infinity,
        //         decoration:
        //             const BoxDecoration(color: Color.fromARGB(255, 35, 35, 35)),
        //         child: Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               const Icon(
        //                 Icons.check_circle,
        //                 color: Colors.green,
        //                 size: 60,
        //               ),
        //               Text(
        //                 "Workout Completed",
        //                 style: GoogleFonts.poppins(
        //                     color: Colors.white,
        //                     fontSize: 18,
        //                     fontWeight: FontWeight.bold),
        //               )
        //             ],
        //           ),
        //         ),
        //       )
        BlocBuilder<WorkoutScreenButtonsBloc, WorkoutScreenButtonsState>(
      builder: (context, state) {
        if (state is Started) {
          return StreamBuilder<int>(
            stream: stopWatchTimer.rawTime,
            initialData: stopWatchTimer.minuteTime.value,
            builder: (context, snapshot) {
              final value = snapshot.data!;
              final displayTime =
                  StopWatchTimer.getDisplayTime(value, milliSecond: false);
              return Text(
                displayTime,
                style: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              );
            },
          );
        } else if (state is OneCompleateState) {
          return const RestNowTimeButtonForLateralBurpee();
        } else if (state is WorkoutCompleted) {
          return InkWell(
            onTap: () {
              // CategoriesRepositoryAddTemp.add(
              //     widget.categoryState.list[0].exercises[i].id,
              //     //     // ==>>>ith mattanam ithil aa complete ayo illayo enn ariyane
              //     widget.categoryState.list[0].id);
              Navigator.pop(context);

              // customNavPush(
              //     context,
              //     SuperSetScreen(
              //       categoryState: widget.categoryState,
              //     ));
            },
            child: Container(
              width: double.infinity,
              decoration:
                  const BoxDecoration(color: Color.fromARGB(255, 35, 35, 35)),
              child: const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 70,
              ),
            ),
          );
        }
        return GestureDetector(
            onTap: () {
              // BlocProvider.of<WorkoutScreenButtonsBloc>(context)
              //     .add(StartWrokoutButton());
              // () => stopWatchTimer.onStartTimer();
              BlocProvider.of<RepsandweightworkoutBloc>(context).add(Checker(
                  totalLength: widget.categoryState.list[0].exercises.length));
              BlocProvider.of<WorkoutScreenButtonsBloc>(context)
                  .add(OneCompleateEvent());
            },
            child: Container(
              width: double.infinity,
              decoration:
                  const BoxDecoration(color: Color.fromARGB(255, 35, 35, 35)),
              child: const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 70,
              ),
            ));
      },
    );
  }
}

class RestNowTimeButtonForLateralBurpee extends StatefulWidget {
  const RestNowTimeButtonForLateralBurpee({super.key});

  @override
  State<RestNowTimeButtonForLateralBurpee> createState() =>
      _RestNowTimeButtonForLateralBurpeeState();
}

class _RestNowTimeButtonForLateralBurpeeState
    extends State<RestNowTimeButtonForLateralBurpee> {
  Stream<int> countdown(int seconds) {
    return Stream.periodic(const Duration(seconds: 1), (x) => seconds - x - 1)
        .take(seconds + 1);
  }

  int timerDuration = 60; // Total duration of the timer in seconds
  late Timer _timer;
  int _remainingTime = 60;
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        BlocProvider.of<WorkoutScreenButtonsBloc>(context)
            .add(WorkoutScreenButtonsEvent());
        BlocProvider.of<SupersetButtonsBloc>(context)
            .add(SupersetButtonsEvent());
        _timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Expanded(
        //     child: Container(
        //   height: 70,
        //   decoration: BoxDecoration(
        //     color: Colors.yellow.withOpacity(0.4),
        //   ),
        //   child: Row(
        //     children: [
        //       Padding(
        //         padding: const EdgeInsets.all(12.0),
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             const Text(
        //               "Rest Now",
        //               style: TextStyle(color: Colors.white),
        //             ),
        //             StreamBuilder<int>(
        //               stream: countdown(60),
        //               initialData: 60,
        //               builder: (context, snapshot) {
        //                 final value = snapshot.data!;
        //                 if (value == 1) {
        //                   BlocProvider.of<WorkoutScreenButtonsBloc>(context)
        //                       .add(WorkoutScreenButtonsEvent());
        //                   // BlocProvider.of<WorkoutScreenButtonsBloc>(context)
        //                   //     .add(StartWrokoutButton());
        //                   // () => stopWatchTimer.onStartTimer();
        //                 }
        //                 return Text(
        //                   "00:$value",
        //                   style: const TextStyle(
        //                       color: Colors.white,
        //                       fontSize: 17,
        //                       fontWeight: FontWeight.w700),
        //                 );
        //               },
        //             ),
        //             // Text(
        //             //   "01:43",
        //             //   style: TextStyle(
        //             //       color: Colors.white,
        //             //       fontSize: 17,
        //             //       fontWeight: FontWeight.w700),
        //             // )
        //           ],
        //         ),
        //       ),
        //     ],
        //   ),
        // )),
        Expanded(
          child: Container(
            height: 70,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
            ),
            child: Stack(
              children: [
                FractionallySizedBox(
                  widthFactor: (timerDuration - _remainingTime) / timerDuration,
                  alignment: Alignment.centerLeft,
                  child: Container(
                    color: Colors.yellow.withOpacity(0.4),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Rest Now",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        "00:${_remainingTime.toString().padLeft(2, '0')}",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              BlocProvider.of<WorkoutScreenButtonsBloc>(context)
                  .add(WorkoutScreenButtonsEvent());

              BlocProvider.of<SupersetButtonsBloc>(context)
                  .add(SupersetButtonsEvent());
              // () => stopWatchTimer.onStartTimer();
            },
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 70, 69, 69).withOpacity(0.4),
              ),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Skip",
                          style: TextStyle(color: Colors.white),
                        ),
                        // Text(
                        //   "",
                        //   style: TextStyle(
                        //       color: Colors.white,
                        //       fontSize: 17,
                        //       fontWeight: FontWeight.w700),
                        // )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
