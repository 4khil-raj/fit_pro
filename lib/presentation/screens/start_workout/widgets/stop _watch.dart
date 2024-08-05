import 'dart:async';
import 'package:fit_pro/application/wokout_screen_buttons/workout_screen_buttons_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StopwatchScreen extends StatefulWidget {
  const StopwatchScreen({super.key});

  @override
  State<StopwatchScreen> createState() => _StopwatchScreenState();
}

class _StopwatchScreenState extends State<StopwatchScreen> {
  late Timer? stopwatchTimer;
  int stopwatchSeconds = 0;
  bool isRunning = false;

  void startStopwatch() {
    setState(() {
      isRunning = true;
    });
    stopwatchTimer?.cancel();
    stopwatchTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        stopwatchSeconds++;
      });
    });
  }

  void stopStopwatch() {
    setState(() {
      isRunning = false;
    });
    stopwatchTimer?.cancel();
  }

  void resetStopwatch() {
    stopStopwatch();
    setState(() {
      stopwatchSeconds = 0;
    });
  }

  @override
  void dispose() {
    stopwatchTimer?.cancel();
    super.dispose();
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
                      "Stopwatch",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "00:$stopwatchSeconds",
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
        )),
        Expanded(
          child: InkWell(
            onTap: isRunning ? stopStopwatch : startStopwatch,
            onLongPress: resetStopwatch, // Option to reset stopwatch
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 70, 69, 69).withOpacity(0.4),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          isRunning ? "Stop" : "Start",
                          style: const TextStyle(color: Colors.white),
                        ),
                        const Text(
                          "Press long to reset",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
