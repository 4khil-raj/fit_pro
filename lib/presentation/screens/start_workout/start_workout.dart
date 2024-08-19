import 'package:fit_pro/presentation/screens/bottom_nav/bottom_nav.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/widget/populate_workout_builder.dart';
import 'package:fit_pro/presentation/screens/start_workout/widgets/lateral_burpee.dart';
import 'package:fit_pro/presentation/widgets/custom_nav/customnav.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartWorkoutScreen extends StatefulWidget {
  const StartWorkoutScreen({super.key});

  @override
  State<StartWorkoutScreen> createState() => _StartWorkoutScreenState();
}

class _StartWorkoutScreenState extends State<StartWorkoutScreen> {
  int i = 3;

  void counter(context) async {
    while (i > 0) {
      await Future.delayed(const Duration(seconds: 1), () {
        i--;
        setState(() {});
      });
    }
    await Future.delayed(const Duration(seconds: 1), () {
      // customNavPush(context, LateralBurpeeScreen());
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: ((context) => LateralBurpeeScreen())));
    });
  }

  @override
  void initState() {
    super.initState();
    counter(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constBottomnavColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              i == 0 ? "GO" : "$i",
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 70,
                  fontWeight: FontWeight.bold),
            ),
            i == 0
                ? const SizedBox()
                : Text(
                    "Get ready",
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
          ],
        ),
      ),
    );
  }
}
