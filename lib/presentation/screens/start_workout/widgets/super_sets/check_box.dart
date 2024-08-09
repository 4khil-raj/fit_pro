import 'package:fit_pro/presentation/screens/start_workout/widgets/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckBoxRowSuperSet extends StatefulWidget {
  const CheckBoxRowSuperSet({super.key});

  @override
  State<CheckBoxRowSuperSet> createState() => _CheckBoxRowSuperSetState();
}

class _CheckBoxRowSuperSetState extends State<CheckBoxRowSuperSet> {
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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    checkButton = true;
                  });
                },
                child: checkButton
                    ? Icon(
                        Icons.check_box,
                        color: Colors.blue,
                      )
                    : Icon(
                        Icons.check_box_outline_blank_outlined,
                        color: Colors.white,
                      ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dumbbell Chest',
                    style: GoogleFonts.poppins(
                        color: Colors.blue, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Text(
                    "Press",
                    style: GoogleFonts.poppins(
                        color: Colors.blue, fontWeight: FontWeight.w600),
                  )
                ],
              ),
              InkWell(
                  onTap: () => weightAndReps(context, 0),
                  child: Text(
                    '20 reps',
                    style: TextStyle(color: Colors.white),
                  )),
              InkWell(
                  onTap: () => weightAndReps(context, 0),
                  child: Text(
                    '10 kg',
                    style: TextStyle(color: Colors.white),
                  )),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    checkButton1 = true;
                  });
                },
                child: checkButton1
                    ? Icon(
                        Icons.check_box,
                        color: Colors.blue,
                      )
                    : Icon(
                        Icons.check_box_outline_blank_outlined,
                        color: Colors.white,
                      ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dumbbell Chest',
                    style: GoogleFonts.poppins(
                        color: Colors.blue, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Text(
                    "Press",
                    style: GoogleFonts.poppins(
                        color: Colors.blue, fontWeight: FontWeight.w600),
                  )
                ],
              ),
              InkWell(
                  onTap: () => weightAndReps(context, 0),
                  child: Text(
                    '20 reps',
                    style: TextStyle(color: Colors.white),
                  )),
              InkWell(
                  onTap: () => weightAndReps(context, 0),
                  child: Text(
                    '10 kg',
                    style: TextStyle(color: Colors.white),
                  )),
            ],
          ),
        ),
        // Spacer(),
        tickmark
            ? Row(
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
                                "Rest Now",
                                style: TextStyle(color: Colors.white),
                              ),
                              StreamBuilder<int>(
                                stream: countdown(60),
                                initialData: 60,
                                builder: (context, snapshot) {
                                  final value = snapshot.data!;
                                  if (value == 1) {
                                    // BlocProvider.of<WorkoutScreenButtonsBloc>(context)
                                    //     .add(WorkoutScreenButtonsEvent());
                                    // BlocProvider.of<WorkoutScreenButtonsBloc>(context)
                                    //     .add(StartWrokoutButton());
                                    // () => stopWatchTimer.onStartTimer();
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
                        // BlocProvider.of<WorkoutScreenButtonsBloc>(context)
                        //     .add(WorkoutScreenButtonsEvent());
                        // () => stopWatchTimer.onStartTimer();
                        tickmark = false;
                      },
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 70, 69, 69)
                              .withOpacity(0.4),
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
              )
            : GestureDetector(
                onTap: () {
                  // BlocProvider.of<WorkoutScreenButtonsBloc>(context)
                  //     .add(StartWrokoutButton());
                  // () => stopWatchTimer.onStartTimer();
                  // BlocProvider.of<WorkoutScreenButtonsBloc>(context)
                  //     .add(OneCompleateEvent());
                  tickmark = true;
                },
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 35, 35, 35)),
                  child: const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 70,
                  ),
                ))
      ],
    );
  }
}
