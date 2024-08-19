import 'package:fit_pro/application/exercises_fetch/exercisefetchbloc_bloc.dart';
import 'package:fit_pro/application/superSetButtons/superset_buttons_bloc.dart';
import 'package:fit_pro/presentation/screens/start_workout/widgets/buttons.dart';
import 'package:fit_pro/presentation/screens/start_workout/widgets/circuit.dart/circuit.dart';
import 'package:fit_pro/presentation/screens/start_workout/widgets/super_sets/super_set.dart';
import 'package:fit_pro/presentation/widgets/custom_nav/customnav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuperSetButtons extends StatelessWidget {
  const SuperSetButtons({
    super.key,
    required this.valu,
  });
  // final SuccessState workoutState;

  Stream<int> countdown(int seconds) {
    return Stream.periodic(const Duration(seconds: 1), (x) => seconds - x - 1)
        .take(seconds + 1);
  }

  final bool valu;
  @override
  Widget build(BuildContext context) {
    return
        // ? Row(
        //     children: [
        //       Expanded(
        //           child: Container(
        //         height: 70,
        //         decoration: BoxDecoration(
        //           color: Colors.yellow.withOpacity(0.4),
        //         ),
        //         child: Row(
        //           children: [
        //             Padding(
        //               padding: const EdgeInsets.all(12.0),
        //               child: Column(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   const Text(
        //                     "Rest Now",
        //                     style: TextStyle(color: Colors.white),
        //                   ),
        //                   StreamBuilder<int>(
        //                     stream: countdown(60),
        //                     initialData: 60,
        //                     builder: (context, snapshot) {
        //                       final value = snapshot.data!;
        //                       if (value == 1) {
        //                         // BlocProvider.of<WorkoutScreenButtonsBloc>(context)
        //                         //     .add(WorkoutScreenButtonsEvent());
        //                         // BlocProvider.of<WorkoutScreenButtonsBloc>(context)
        //                         //     .add(StartWrokoutButton());
        //                         // () => stopWatchTimer.onStartTimer();
        //                       }
        //                       return Text(
        //                         "00:$value",
        //                         style: const TextStyle(
        //                             color: Colors.white,
        //                             fontSize: 17,
        //                             fontWeight: FontWeight.w700),
        //                       );
        //                     },
        //                   ),
        //                   // Text(
        //                   //   "01:43",
        //                   //   style: TextStyle(
        //                   //       color: Colors.white,
        //                   //       fontSize: 17,
        //                   //       fontWeight: FontWeight.w700),
        //                   // )
        //                 ],
        //               ),
        //             ),
        //           ],
        //         ),
        //       )),
        //       Expanded(
        //         child: InkWell(
        //           onTap: () {
        //             // BlocProvider.of<WorkoutScreenButtonsBloc>(context)
        //             //     .add(WorkoutScreenButtonsEvent());
        //             // () => stopWatchTimer.onStartTimer();
        //             // tickmark = false;
        //           },
        //           child: Container(
        //             height: 70,
        //             decoration: BoxDecoration(
        //               color: const Color.fromARGB(255, 70, 69, 69)
        //                   .withOpacity(0.4),
        //             ),
        //             child: const Row(
        //               crossAxisAlignment: CrossAxisAlignment.end,
        //               mainAxisAlignment: MainAxisAlignment.end,
        //               children: [
        //                 Padding(
        //                   padding: EdgeInsets.all(15.0),
        //                   child: Column(
        //                     crossAxisAlignment: CrossAxisAlignment.end,
        //                     mainAxisAlignment: MainAxisAlignment.center,
        //                     children: [
        //                       Text(
        //                         "Skip",
        //                         style: TextStyle(color: Colors.white),
        //                       ),
        //                       // Text(
        //                       //   "",
        //                       //   style: TextStyle(
        //                       //       color: Colors.white,
        //                       //       fontSize: 17,
        //                       //       fontWeight: FontWeight.w700),
        //                       // )
        //                     ],
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //       )
        //     ],
        //   )
        BlocBuilder<SupersetButtonsBloc, SupersetButtonsState>(
      builder: (context, state) {
        if (state is DoneState) {
          return RestNowTimeButtonForLateralBurpee();
        } else if (state is Goback) {
          return GestureDetector(
              onTap: () {
                // BlocProvider.of<WorkoutScreenButtonsBloc>(context)
                //     .add(StartWrokoutButton());
                // () => stopWatchTimer.onStartTimer();
                // BlocProvider.of<WorkoutScreenButtonsBloc>(context)
                //     .add(OneCompleateEvent());
                // valu = true;
                j = 0;
                valu
                    ? WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                        // customNavReplacement(context, CircuitScreenWorkouts());
                      })
                    : Navigator.pop(context);
                //

                // return SizedBox();
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
        } else if (state is SupersetButtonsInitial) {
          return GestureDetector(
              onTap: () {
                // BlocProvider.of<WorkoutScreenButtonsBloc>(context)
                //     .add(StartWrokoutButton());
                // () => stopWatchTimer.onStartTimer();
                // BlocProvider.of<WorkoutScreenButtonsBloc>(context)
                //     .add(OneCompleateEvent());
                // valu = true;
                BlocProvider.of<SupersetButtonsBloc>(context).add(Done());
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
        }
        return GestureDetector(
            onTap: () {
              // BlocProvider.of<WorkoutScreenButtonsBloc>(context)
              //     .add(StartWrokoutButton());
              // () => stopWatchTimer.onStartTimer();
              // BlocProvider.of<WorkoutScreenButtonsBloc>(context)
              //     .add(OneCompleateEvent());
              // valu = true;
              Navigator.pop(context);
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
