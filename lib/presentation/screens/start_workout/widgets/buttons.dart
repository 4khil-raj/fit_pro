import 'package:fit_pro/application/wokout_screen_buttons/workout_screen_buttons_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

final StopWatchTimer stopWatchTimer = StopWatchTimer();

class TickButtonForLateralBurpee extends StatefulWidget {
  const TickButtonForLateralBurpee({super.key});

  @override
  State<TickButtonForLateralBurpee> createState() =>
      _TickButtonForLateralBurpeeState();
}

class _TickButtonForLateralBurpeeState
    extends State<TickButtonForLateralBurpee> {
  bool button = true;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutScreenButtonsBloc, WorkoutScreenButtonsState>(
      builder: (context, state) {
        if (state is Started) {
          return StreamBuilder<int>(
            stream: stopWatchTimer.rawTime,
            initialData: stopWatchTimer.minuteTime.value,
            builder: (context, snapshot) {
              final value = snapshot.data!;
              final displayTime = StopWatchTimer.getDisplayTime(value);
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
              Navigator.pop(context);
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
            ),
          );
        }
        return GestureDetector(
            onTap: () {
              BlocProvider.of<WorkoutScreenButtonsBloc>(context)
                  .add(StartWrokoutButton());
              () => stopWatchTimer.onStartTimer();
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

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
          height: 70,
          decoration: BoxDecoration(
            color: Colors.yellow.withOpacity(0.4),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Reset Now",
                      style: TextStyle(color: Colors.white),
                    ),
                    StreamBuilder<int>(
                      stream: countdown(60),
                      initialData: 60,
                      builder: (context, snapshot) {
                        final value = snapshot.data!;
                        if (value == 1) {
                          BlocProvider.of<WorkoutScreenButtonsBloc>(context)
                              .add(StartWrokoutButton());
                          () => stopWatchTimer.onStartTimer();
                        }
                        return Text(
                          "00:$value",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w700),
                        );
                      },
                    ),
                    // Text(
                    //   "01:43",
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
        )),
        Expanded(
          child: InkWell(
            onTap: () {
              BlocProvider.of<WorkoutScreenButtonsBloc>(context)
                  .add(StartWrokoutButton());
              () => stopWatchTimer.onStartTimer();
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
