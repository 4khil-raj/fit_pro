import 'package:fit_pro/presentation/screens/bottom_nav/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartWorkoutScreen extends StatefulWidget {
  StartWorkoutScreen({super.key});

  @override
  State<StartWorkoutScreen> createState() => _StartWorkoutScreenState();
}

class _StartWorkoutScreenState extends State<StartWorkoutScreen> {
  int i = 3;
  @override
  void initState() {
    super.initState();
    while (i > 0) {
      Future.delayed(const Duration(seconds: 1), () {
        i--;
      });
    }
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
              "$i",
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 70,
                  fontWeight: FontWeight.bold),
            ),
            Text(
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
