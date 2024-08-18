import 'package:fit_pro/application/reps&weight/repsandweightworkout_bloc.dart';
import 'package:fit_pro/application/category_bloc/category_fetch_bloc.dart';
import 'package:fit_pro/application/superset_checker/supersetscreencheckbox_bloc.dart';
import 'package:fit_pro/application/wokout_screen_buttons/workout_screen_buttons_bloc.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/sub_pages/featured_plans/widgets/daily_task_builder.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/widget/populate_workout_builder.dart';
import 'package:fit_pro/presentation/screens/start_workout/widgets/bottom_sheet.dart';
import 'package:fit_pro/presentation/screens/start_workout/widgets/lateral_burpee.dart';
import 'package:fit_pro/presentation/screens/start_workout/widgets/super_sets/super.dart';
import 'package:fit_pro/presentation/screens/start_workout/widgets/super_sets/super_set.dart';
import 'package:fit_pro/presentation/widgets/custom_nav/customnav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckBoxSetRows extends StatelessWidget {
  const CheckBoxSetRows({
    super.key,
  });
  // final CategoryFetched stateValue;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: exerciseData[i].sets,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                const EdgeInsets.only(top: 30, bottom: 20, left: 30, right: 30),
            child: BlocBuilder<RepsandweightworkoutBloc,
                RepsandweightworkoutState>(
              builder: (context, state) {
                if (state is Selectedd) {
                  // if (i == stateValue.list[0].exercises.length &&
                  //     state.done.length ==
                  //         stateValue.list[0].exercises[i].sets) {
                  //   print(
                  //       '====================]]]]]]]]]]]][[[[[[[[[[[]]]]]]]]]]]');
                  //   print(stateValue.list[0].id);
                  //   // BlocProvider.of<WorkoutScreenButtonsBloc>(context)
                  //   //     .add(WorkoutCompleateEvent());
                  //   customNavPush(
                  //       context, SuperSetScreen(categoryState: stateValue));
                  // }
                  if (state.done.length == exerciseData[i].sets &&
                      exerciseData.length - 1 > i) {
                    BlocProvider.of<CategoryFetchBloc>(context)
                        .add(NextWorkout(index: i));
                    BlocProvider.of<RepsandweightworkoutBloc>(context)
                        .add(ClearList());
                    // BlocProvider.of<WorkoutScreenButtonsBloc>(context)
                    //     .add(WorkoutScreenButtonsEvent());
                  } else if (exerciseData.length - 1 == i) {
                    // BlocProvider.of<WorkoutScreenButtonsBloc>(context)
                    //     .add(WorkoutCompleateEvent());

                    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                      BlocProvider.of<SupersetscreencheckboxBloc>(context)
                          .add(ClearListt());
                      j = 0;

                      return customNavReplacement(
                          context,
                          SuperSetLunchScreen(
                            workoutID: exerciseGlobalId,
                          ));
                    });
                  }

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      state.done.contains(index)
                          ? Icon(
                              Icons.check_box,
                              color: Colors.blue,
                            )
                          : InkWell(
                              onTap: () {
                                print('ond');
                                BlocProvider.of<RepsandweightworkoutBloc>(
                                        context)
                                    .add(WorkoutDone(indexdone: index));
                                BlocProvider.of<RepsandweightworkoutBloc>(
                                        context)
                                    .add(IconIndexPicker(index: index));
                                // BlocProvider.of<RepsandweightworkoutBloc>(context).add(G),
                                // BlocProvider.of<WorkoutScreenButtonsBloc>(
                                //         context)
                                //     .add(OneCompleateEvent());
                              },
                              child: Icon(
                                Icons.check_box_outline_blank_outlined,
                                color: Colors.white,
                              ),
                            ),
                      Row(
                        children: [
                          Text(
                            (index + 1).toString(),
                            style: state.done.contains(index)
                                ? GoogleFonts.poppins(
                                    color: Color.fromARGB(255, 141, 136, 136),
                                    fontWeight: FontWeight.w600)
                                : GoogleFonts.poppins(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Text(
                            "Set",
                            style: state.done.contains(index)
                                ? GoogleFonts.poppins(
                                    color: Color.fromARGB(255, 141, 136, 136),
                                    fontWeight: FontWeight.w600)
                                : GoogleFonts.poppins(
                                    color: Colors.blue, fontSize: 12),
                          )
                        ],
                      ),
                      InkWell(
                          onTap: () => weightAndReps(context, index),
                          child: state.list.contains(index)
                              ? Row(
                                  children: [
                                    Text(
                                      // state.reps.toString()
                                      state.repsfulllist.containsKey(index)
                                          ? state.repsfulllist[index].toString()
                                          : '20',
                                      style: state.done.contains(index)
                                          ? GoogleFonts.poppins(
                                              color: Color.fromARGB(
                                                  255, 141, 136, 136),
                                              fontWeight: FontWeight.w600)
                                          : GoogleFonts.poppins(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      width: 7,
                                    ),
                                    Text(
                                      "reps",
                                      style: state.done.contains(index)
                                          ? GoogleFonts.poppins(
                                              color: Color.fromARGB(
                                                  255, 141, 136, 136),
                                              fontWeight: FontWeight.w600)
                                          : GoogleFonts.poppins(
                                              color: Colors.blue, fontSize: 12),
                                    )
                                  ],
                                )
                              : Text(
                                  '20 reps',
                                  style: TextStyle(color: Colors.blue),
                                )),
                      InkWell(
                          onTap: () => weightAndReps(context, index),
                          child: state.list.contains(index)
                              ? Row(
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
                                          : GoogleFonts.poppins(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      width: 7,
                                    ),
                                    Text(
                                      "kg",
                                      style: state.done.contains(index)
                                          ? GoogleFonts.poppins(
                                              color: Color.fromARGB(
                                                  255, 141, 136, 136),
                                              fontWeight: FontWeight.w600)
                                          : GoogleFonts.poppins(
                                              color: Colors.blue, fontSize: 12),
                                    )
                                  ],
                                )
                              : Text(
                                  '10 kg',
                                  style: TextStyle(color: Colors.blue),
                                )),
                    ],
                  );
                }
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        BlocProvider.of<RepsandweightworkoutBloc>(context)
                            .add(WorkoutDone(indexdone: index));
                        BlocProvider.of<RepsandweightworkoutBloc>(context)
                            .add(IconIndexPicker(index: index));
                        // BlocProvider.of<RepsandweightworkoutBloc>(context).add(G),
                        BlocProvider.of<WorkoutScreenButtonsBloc>(context)
                            .add(OneCompleateEvent());
                      },
                      child: Icon(
                        Icons.check_box_outline_blank_outlined,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          (index + 1).toString(),
                          style: GoogleFonts.poppins(
                              color: Colors.blue, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        Text(
                          "Set",
                          style: GoogleFonts.poppins(
                              color: Colors.blue, fontSize: 12),
                        )
                      ],
                    ),
                    InkWell(
                        onTap: () => weightAndReps(context, index),
                        child: Text(
                          '20 reps',
                          style: TextStyle(color: Colors.blue),
                        )),
                    InkWell(
                        onTap: () => weightAndReps(context, index),
                        child: Text(
                          '10 kg',
                          style: TextStyle(color: Colors.blue),
                        )),
                  ],
                );
              },
            ),
          );
        });
  }
}
