// ignore_for_file: prefer_const_constructors

import 'package:fit_pro/presentation/screens/start_workout/widgets/buttons.dart';
import 'package:fit_pro/presentation/screens/start_workout/widgets/carousel.dart';
import 'package:fit_pro/presentation/screens/start_workout/widgets/check_box_row.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LateralBurpeeScreen extends StatelessWidget {
  const LateralBurpeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 6, 2, 19),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 6, 2, 19),
        iconTheme:
            IconThemeData(color: const Color.fromARGB(255, 255, 255, 255)),
        title: Column(
          children: [
            Text(
              "Lateral Burpee",
              style: GoogleFonts.poppins(
                  color: Colors.white, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Execise 1 of 12",
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 216, 210, 210),
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          CarouselForWorkout(),
          CheckBoxSetRows(), Spacer(),
          TickButtonForLateralBurpee()
          //
        ],
      ),
    );
  }
}
