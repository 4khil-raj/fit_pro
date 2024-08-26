import 'package:fit_pro/application/superSetButtons/superset_buttons_bloc.dart';
import 'package:fit_pro/application/superset_checker/supersetscreencheckbox_bloc.dart';
import 'package:fit_pro/application/exercises_fetch/exercisefetchbloc_bloc.dart';
import 'package:fit_pro/presentation/screens/start_workout/widgets/bottom_sheet.dart';
import 'package:fit_pro/presentation/screens/start_workout/widgets/circuit.dart/circuit.dart';
import 'package:fit_pro/presentation/screens/start_workout/widgets/super_sets/buttons.dart';
import 'package:fit_pro/presentation/screens/start_workout/widgets/super_sets/super_set.dart';
import 'package:fit_pro/presentation/widgets/alerts/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckBoxRowCircuit extends StatefulWidget {
  const CheckBoxRowCircuit({
    super.key,
  });
  // final SuccessState workoutState;

  @override
  State<CheckBoxRowCircuit> createState() => _CheckBoxRowCircuitState();
}

class _CheckBoxRowCircuitState extends State<CheckBoxRowCircuit> {
  Stream<int> countdown(int seconds) {
    return Stream.periodic(const Duration(seconds: 1), (x) => seconds - x - 1)
        .take(seconds + 1);
  }

  bool checkButton = false;
  bool checkButton1 = false;
  bool tickmark = false;
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {});
    });

    return BlocBuilder<SupersetscreencheckboxBloc, SupersetscreencheckboxState>(
      builder: (context, state) {
        // j = widget.workoutState.index;

        if (state is Selected) {
          if (state.done.length == flattenedCircuits[j]['sets'] &&
              flattenedCircuits.length - 1 > j) {
            BlocProvider.of<ExercisefetchblocBloc>(context)
                .add(NextWorkouts(index: j));
            BlocProvider.of<SupersetscreencheckboxBloc>(context)
                .add(ClearListt());
          } else if (flattenedCircuits.length - 1 == j &&
              state.done.length == flattenedCircuits[j]['sets']) {
            BlocProvider.of<SupersetButtonsBloc>(context).add(Gobak());
            // flattenedCircuits = [];
          }
          return SizedBox(
            height: 370,
            child: ListView.builder(
                itemCount: flattenedCircuits[j]['sets'],
                itemBuilder: (context, index) {
                  // if()

                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        state.done.contains(index)
                            ? InkWell(
                                onTap: () {
                                  // BlocProvider.of<SupersetscreencheckboxBloc>(context)
                                  //     .add(CompletedWorkout(index: index));
                                  print(index);
                                },
                                child: Icon(
                                  Icons.check_box,
                                  color: Colors.blue,
                                ),
                              )
                            : InkWell(
                                onTap: () {
                                  if (doneEmitted == false) {
                                    BlocProvider.of<SupersetButtonsBloc>(
                                            context)
                                        .add(Done());
                                    BlocProvider.of<SupersetscreencheckboxBloc>(
                                            context)
                                        .add(SuperSetCompletedWorkout(
                                            index: index));
                                  } else {
                                    homeSnackbar(
                                        context, 'Take Rest', Colors.red);
                                  }
                                },
                                child: Icon(
                                  Icons.check_box_outline_blank_outlined,
                                  color: Colors.white,
                                ),
                              ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              flattenedCircuits[j]['name'],
                              style: state.done.contains(index)
                                  ? GoogleFonts.poppins(
                                      color: Color.fromARGB(255, 141, 136, 136),
                                      fontWeight: FontWeight.w600)
                                  : GoogleFonts.poppins(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w600),
                            ),
                            // const SizedBox(
                            //   width: 7,
                            // ),
                            // Text(
                            //   "Press",
                            //   style: GoogleFonts.poppins(
                            //       color: Colors.blue,
                            //       fontWeight: FontWeight.w600),
                            // )
                          ],
                        ),
                        InkWell(
                            onTap: () {
                              state.done.contains(index)
                                  ? null
                                  : weightAndReps(context, index);
                            },
                            child: Row(
                              children: [
                                Text(
                                  state.repsfulllist.containsKey(index)
                                      ? state.repsfulllist[index].toString()
                                      : '20',
                                  style: state.done.contains(index)
                                      ? GoogleFonts.poppins(
                                          color: Color.fromARGB(
                                              255, 141, 136, 136),
                                          fontWeight: FontWeight.w600)
                                      : TextStyle(color: Colors.blue),
                                ),
                                Text(
                                  ' reps',
                                  style: state.done.contains(index)
                                      ? GoogleFonts.poppins(
                                          color: Color.fromARGB(
                                              255, 141, 136, 136),
                                          fontWeight: FontWeight.w600)
                                      : TextStyle(color: Colors.blue),
                                ),
                              ],
                            )),
                        flattenedCircuits[j]['weighted'] == 'No'
                            ? SizedBox()
                            : InkWell(
                                onTap: () {
                                  state.done.contains(index)
                                      ? null
                                      : weightAndReps(context, index);
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      state.weightfulllist.containsKey(index)
                                          ? state.weightfulllist[index]
                                              .toString()
                                          : "10",
                                      style: state.done.contains(index)
                                          ? GoogleFonts.poppins(
                                              color: Color.fromARGB(
                                                  255, 141, 136, 136),
                                              fontWeight: FontWeight.w600)
                                          : TextStyle(color: Colors.blue),
                                    ),
                                    Text(
                                      ' kg',
                                      style: state.done.contains(index)
                                          ? GoogleFonts.poppins(
                                              color: Color.fromARGB(
                                                  255, 141, 136, 136),
                                              fontWeight: FontWeight.w600)
                                          : TextStyle(color: Colors.blue),
                                    )
                                  ],
                                )),
                      ],
                    ),
                  );
                }),
          );
        }
        return SizedBox(
          height: 370,
          child: ListView.builder(
              itemCount: flattenedCircuits[j]['sets'],
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          BlocProvider.of<SupersetscreencheckboxBloc>(context)
                              .add(SuperSetCompletedWorkout(index: index));
                          BlocProvider.of<SupersetButtonsBloc>(context)
                              .add(Done());
                        },
                        child: Icon(
                          Icons.check_box_outline_blank_outlined,
                          color: Colors.white,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            flattenedCircuits[j]['name'],
                            style: GoogleFonts.poppins(
                                color: Colors.blue,
                                fontWeight: FontWeight.w600),
                          ),
                          // const SizedBox(
                          //   width: 7,
                          // ),
                          // Text(
                          //   "Press",
                          //   style: GoogleFonts.poppins(
                          //       color: Colors.blue,
                          //       fontWeight: FontWeight.w600),
                          // )
                        ],
                      ),
                      InkWell(
                          onTap: () => weightAndReps(context, index),
                          child: Text(
                            '20 reps',
                            style: TextStyle(color: Colors.blue),
                          )),
                      flattenedCircuits[j]['weighted'] == 'No'
                          ? SizedBox()
                          : InkWell(
                              onTap: () => weightAndReps(context, index),
                              child: Text(
                                '10 kg',
                                style: TextStyle(color: Colors.blue),
                              )),
                    ],
                  ),
                );
              }),
        );
      },
    );
  }
}
