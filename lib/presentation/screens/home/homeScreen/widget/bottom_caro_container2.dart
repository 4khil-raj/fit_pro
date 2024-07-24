import 'package:fit_pro/domain/models/workout_plans/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomCaroselcontainer2 extends StatelessWidget {
  final List<WorkoutPlanModel> list;
  BottomCaroselcontainer2({this.image, super.key, required this.list});
  String? image;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: MediaQuery.of(context).size.width,
        // height: 200,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  list[2].bannerImage ?? "assets/images/carosel.jpg",
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
                list[1].planName ?? "Weightligting",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w900,
                    fontSize: 14,
                    color: const Color.fromARGB(255, 12, 144, 252)),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                list[1].workoutKeywords ?? "14 Day Challenge",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w800,
                    fontSize: 17,
                    color: Colors.white),
              ),
              Text(
                list[1].estimatedDuration ?? "2 Week | GYM",
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
