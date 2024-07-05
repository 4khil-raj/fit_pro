import 'package:fit_pro/application/start_workout/start_workout_bloc.dart';
import 'package:fit_pro/presentation/widgets/buttons/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlanProgressScreenButtons extends StatelessWidget {
  const PlanProgressScreenButtons({super.key, required this.value});
  final bool value;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double container1Width = screenWidth * 0.12;
    return value
        ? Padding(
            padding: const EdgeInsets.all(12.0),
            child: CustomButton(
              isNetwork: false,
              isRow: false,
              color: const Color.fromARGB(255, 219, 203, 59),
              borderclr: const Color.fromARGB(255, 179, 165, 41),
              fontweight: FontWeight.w700,
              height: 50,
              name: "Redo Workout",
              radius: 10,
              textclr: Colors.black,
              textsize: 14,
              onTap: () => BlocProvider.of<StartWorkoutBloc>(context)
                  .add(StartWorkoutEvent(value: value)),
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  width: container1Width,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10)),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.bookmark_outline,
                        color: Colors.white,
                      )),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
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
                      onTap: () => BlocProvider.of<StartWorkoutBloc>(context)
                          .add(StartWorkoutEvent(value: value)),
                    ),
                  ),
                )
              ],
            ),
          );
  }
}
