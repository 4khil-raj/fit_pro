import 'package:fit_pro/application/exercises_fetch/exercisefetchbloc_bloc.dart';
import 'package:fit_pro/application/superSetButtons/superset_buttons_bloc.dart';
import 'package:fit_pro/application/superset_checker/supersetscreencheckbox_bloc.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/widget/populate_workout_builder.dart';
import 'package:fit_pro/presentation/screens/start_workout/widgets/buttons.dart';
import 'package:fit_pro/presentation/screens/start_workout/widgets/circuit.dart/circuit.dart';
import 'package:fit_pro/presentation/screens/start_workout/widgets/lateral_burpee.dart';
import 'package:fit_pro/presentation/screens/start_workout/widgets/super_sets/super_set.dart';
import 'package:fit_pro/presentation/widgets/custom_nav/customnav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

bool doneEmitted = false;

class SuperSetButtons extends StatefulWidget {
  const SuperSetButtons({
    super.key,
    required this.valu,
  });
  final bool valu;

  @override
  State<SuperSetButtons> createState() => _SuperSetButtonsState();
}

class _SuperSetButtonsState extends State<SuperSetButtons> {
  // final SuccessState workoutState;
  Stream<int> countdown(int seconds) {
    return Stream.periodic(const Duration(seconds: 1), (x) => seconds - x - 1)
        .take(seconds + 1);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SupersetButtonsBloc, SupersetButtonsState>(
      builder: (context, state) {
        if (state is DoneState) {
          doneEmitted = true;
          return RestNowTimeButtonForLateralBurpee();
        } else if (state is Goback) {
          // flattenedCircuits = [];
          return GestureDetector(
              onTap: () {
                BlocProvider.of<SupersetscreencheckboxBloc>(context)
                    .add(ClearListt());
                flattenedCircuits = [];

                j = 0;
                widget.valu
                    ? WidgetsBinding.instance.addPostFrameCallback((_) {
                        customNavReplacement(context, CircuitScreenWorkouts());
                      })
                    : {
                        flattenedCircuits.isEmpty && supersetList.isNotEmpty
                            ? WidgetsBinding.instance.addPostFrameCallback((_) {
                                customNavReplacement(
                                    context,
                                    LateralBurpeeScreen(
                                      workout: false,
                                      coolDown: true,
                                    ));
                              })
                            : {
                                // Navigator.pop(context),
                                // Navigator.pop(context),

                                BlocProvider.of<SupersetscreencheckboxBloc>(
                                        context)
                                    .add(ClearListt()),
                                BlocProvider.of<ExercisefetchblocBloc>(context)
                                    .add(NextWorkouts(index: 0))
                              }
                      };
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
                BlocProvider.of<SupersetButtonsBloc>(context).add(Done());
                widget.valu
                    ? BlocProvider.of<SupersetscreencheckboxBloc>(context).add(
                        Checker(totalLength: flattenedSupersets[j]['sets']))
                    : BlocProvider.of<SupersetscreencheckboxBloc>(context).add(
                        Checker(totalLength: flattenedCircuits[j]['sets']));
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
