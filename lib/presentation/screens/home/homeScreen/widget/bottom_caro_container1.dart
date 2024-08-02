import 'package:fit_pro/domain/models/workout_plans/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomCaroselContainer1 extends StatelessWidget {
  final List<WorkoutPlanModel> list;
  final int index;
  BottomCaroselContainer1(
      {this.image1, super.key, required this.list, required this.index});
  String? image1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Stack(children: [
        Container(
          width: MediaQuery.of(context).size.width - 10,
          // height: 200,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    list[index].bannerImage,
                  )),
              borderRadius: BorderRadius.circular(8)),
        ),
        Positioned(
            bottom: 19,
            left: 19,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  list[index].planName,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w900,
                      fontSize: 14,
                      color: const Color.fromARGB(255, 12, 144, 252)),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  list[index].workoutKeywords ?? "14 Day Challenge",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w800,
                      fontSize: 17,
                      color: Colors.white),
                ),
                Text(
                  list[index].estimatedDuration ?? "2 Week | GYM",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Colors.white),
                )
              ],
            ))
      ]),
    );
  }
}
