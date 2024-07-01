// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:fit_pro/presentation/screens/home/progress/widget/stats/widget/all_achievement.dart';
import 'package:fit_pro/presentation/widgets/custom_nav/customnav.dart';
import 'package:fit_pro/presentation/widgets/hexogon/custom_shape.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AchievementsWidgetProgressScreen extends StatelessWidget {
  const AchievementsWidgetProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 53, 53, 53),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Achievements',
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    TextButton(
                        onPressed: () =>
                            customNavPush(context, AchievementsScreenstats()),
                        child: Text(
                          "See all",
                          style: TextStyle(
                              color: Color.fromARGB(255, 80, 172, 248)),
                        ))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          CustomPaint(
                            painter: HexagonPainter(
                                color: Color.fromARGB(255, 52, 70, 85)),
                            child: Container(
                              // width: 100,
                              // height: 100,
                              child: Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: Center(
                                    child: FaIcon(
                                  FontAwesomeIcons.medal,
                                  size: 40,
                                  color:
                                      const Color.fromARGB(255, 117, 193, 255),
                                )),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'First 5K Run',
                            style: GoogleFonts.rubik(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      Spacer(),
                      Column(
                        children: [
                          CustomPaint(
                            painter: HexagonPainter(
                                color: const Color.fromARGB(255, 52, 70, 85)),
                            child: Container(
                              // width: 100,
                              // height: 100,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Center(
                                    child: Icon(Icons.star_border_purple500,
                                        color: const Color.fromARGB(
                                            255, 117, 193, 255),
                                        size: 50)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Determination',
                            style: GoogleFonts.rubik(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      Spacer(),
                      Column(
                        children: [
                          CustomPaint(
                            painter: HexagonPainter(
                                color: Color.fromARGB(255, 52, 70, 85)),
                            child: Container(
                              // width: 100,
                              // height: 100,
                              child: Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: Center(
                                    child: FaIcon(
                                  Icons.celebration_outlined,
                                  size: 40,
                                  color: Color.fromARGB(255, 117, 193, 255),
                                )),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '100th Workout',
                            style: GoogleFonts.rubik(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
