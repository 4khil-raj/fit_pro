import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';

class ChallengeTextProgressScreen extends StatefulWidget {
  const ChallengeTextProgressScreen({super.key});

  @override
  State<ChallengeTextProgressScreen> createState() =>
      _ChallengeTextProgressScreenState();
}

class _ChallengeTextProgressScreenState
    extends State<ChallengeTextProgressScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "2 Week Challenge",
                style: GoogleFonts.urbanist(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Color.fromARGB(255, 92, 233, 248)),
              ),
              SizedBox(
                height: 14,
              ),
              Text(
                "Day 16 | Metabolic Booster",
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "55 min | Bodyweight | 4 Rounds Total",
                style: GoogleFonts.poppins(
                    color: const Color.fromARGB(255, 212, 204, 204),
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(
              //     children: [
              //       Icon(
              //         Icons.alarm,
              //         color: Color.fromARGB(255, 92, 233, 248),
              //       ),
              //       SizedBox(
              //         width: 10,
              //       ),
              //       Text(
              //         "Set Reminder",
              //         style: GoogleFonts.poppins(
              //             color: Color.fromARGB(255, 92, 233, 248),
              //             fontSize: 16,
              //             fontWeight: FontWeight.w500),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
