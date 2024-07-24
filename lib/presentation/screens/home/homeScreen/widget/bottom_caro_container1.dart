import 'package:fit_pro/domain/models/workout_plans/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomCaroselContainer1 extends StatelessWidget {
  final List<WorkoutPlanModel> list;

  BottomCaroselContainer1({this.image1, super.key, required this.list});
  String? image1;

  @override
  Widget build(BuildContext context) {
    print(list[0].bannerImage);
    return Stack(children: [
      Container(
        width: MediaQuery.of(context).size.width,
        // height: 200,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  list[0].bannerImage ?? "assets/icons/workout.jpg",
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
                list[0].planName,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w900,
                    fontSize: 14,
                    color: const Color.fromARGB(255, 12, 144, 252)),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                list[0].workoutKeywords ?? "14 Day Challenge",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w800,
                    fontSize: 17,
                    color: Colors.white),
              ),
              Text(
                list[0].estimatedDuration ?? "2 Week | GYM",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.white),
              )
            ],
          ))
    ]);
  }
}
