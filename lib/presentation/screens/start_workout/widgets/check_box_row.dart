import 'package:fit_pro/application/reps&weight/repsandweightworkout_bloc.dart';
import 'package:fit_pro/application/category_bloc/category_fetch_bloc.dart';
import 'package:fit_pro/application/wokout_screen_buttons/workout_screen_buttons_bloc.dart';
import 'package:fit_pro/infrastructure/repository/temp_category/temp.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/widget/populate_workout.dart';
import 'package:fit_pro/presentation/screens/start_workout/widgets/bottom_sheet.dart';
import 'package:fit_pro/presentation/screens/start_workout/widgets/lateral_burpee.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckBoxSetRows extends StatelessWidget {
  const CheckBoxSetRows({super.key, required this.stateValue});
  final CategoryFetched stateValue;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => weightAndReps(context,index),
      child: SizedBox(
        // height: MediaQuery.of(context).size.height / 2,
        child: ListView.builder(
            itemCount: stateValue.list[0].exercises.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                    top: 30, bottom: 20, left: 30, right: 30),
                child: BlocBuilder<RepsandweightworkoutBloc,
                    RepsandweightworkoutState>(
                  builder: (context, state) {
                    if (state is Selected) {
                      if (state.done.length ==
                          stateValue.list[0].exercises.length) {
                        BlocProvider.of<WorkoutScreenButtonsBloc>(context)
                            .add(WorkoutCompleateEvent());
                      }
                      // if (state.done.length ==
                      //     stateValue.list[0].exercises.length) {
                      //   i++;
                      //   BlocProvider.of<CategoryFetchBloc>(context)
                      //       .add(CategoryFetchReq(id: categoryIdWorkout!)); ith manage cheyyanam ith i vechit aa listinte value edukkunneya  oro
                      //exercise full kazhimbolum ith trigger cheyth oru loading animation okke kodukkanam
                      // }

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          categoryforWorkout.contains(stateValue.list[0].id)
                              ? Icon(
                                  Icons.check_box,
                                  color: Colors.blue,
                                )
                              : state.done.contains(index) &&
                                      state.list.contains(index)
                                  ? Icon(
                                      Icons.check_box,
                                      color: Colors.blue,
                                    )
                                  : InkWell(
                                      onTap: () {
                                        BlocProvider.of<
                                                    RepsandweightworkoutBloc>(
                                                context)
                                            .add(WorkoutDone(indexdone: index));
                                        BlocProvider.of<
                                                    WorkoutScreenButtonsBloc>(
                                                context)
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
                                stateValue.list[0].exercises[index].sets
                                    .toString(),
                                style: GoogleFonts.poppins(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                width: 7,
                              ),
                              Text(
                                "Set",
                                style: GoogleFonts.poppins(
                                    color: Colors.white, fontSize: 12),
                              )
                            ],
                          ),
                          InkWell(
                            onTap: () => weightAndReps(context, index),
                            child: state.list.contains(index)
                                ? Row(
                                    children: [
                                      Text(
                                        state.reps.toString(),
                                        style: GoogleFonts.poppins(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(
                                        width: 7,
                                      ),
                                      Text(
                                        "reps",
                                        style: GoogleFonts.poppins(
                                            color: Colors.white, fontSize: 12),
                                      )
                                    ],
                                  )
                                : const Icon(
                                    Icons.add_circle_outline_sharp,
                                    color: Colors.white,
                                  ),
                          ),
                          InkWell(
                            onTap: () => weightAndReps(context, index),
                            child: state.list.contains(index)
                                ? Row(
                                    children: [
                                      Text(
                                        state.weight.toString(),
                                        style: GoogleFonts.poppins(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(
                                        width: 7,
                                      ),
                                      Text(
                                        "kg",
                                        style: GoogleFonts.poppins(
                                            color: Colors.white, fontSize: 12),
                                      )
                                    ],
                                  )
                                : const Icon(
                                    Icons.add_circle_outline_sharp,
                                    color: Colors.white,
                                  ),
                          ),
                        ],
                      );
                    }
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        categoryforWorkout.contains(stateValue.list[0].id)
                            ? Icon(
                                Icons.check_box,
                                color: Colors.blue,
                              )
                            : Icon(
                                Icons.check_box_outline_blank_outlined,
                                color: Colors.white,
                              ),
                        Row(
                          children: [
                            Text(
                              stateValue.list[0].exercises[index].sets
                                  .toString(),
                              style: GoogleFonts.poppins(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            Text(
                              "Set",
                              style: GoogleFonts.poppins(
                                  color: Colors.white, fontSize: 12),
                            )
                          ],
                        ),
                        InkWell(
                          onTap: () => weightAndReps(context, index),
                          child: const Icon(
                            Icons.add_circle_outline_sharp,
                            color: Colors.white,
                          ),
                        ),
                        InkWell(
                          onTap: () => weightAndReps(context, index),
                          child: const Icon(
                            Icons.add_circle_outline_sharp,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            }),
      ),
    );
  }
}
