// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:fit_pro/presentation/widgets/hexogon/custom_shape.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AchievementsScreenstats extends StatelessWidget {
  const AchievementsScreenstats({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 6, 2, 19),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 53, 53, 53),
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          "Achievements",
          style: GoogleFonts.poppins(fontSize: 22, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
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
                                color: const Color.fromARGB(255, 117, 193, 255),
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
              ),
              // SizedBox(
              //   height: 10,
              // ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Stack(children: [
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
                                  Icons.stars_outlined,
                                  size: 40,
                                  color:
                                      const Color.fromARGB(255, 215, 218, 221),
                                )),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Road to FitPro',
                            style: GoogleFonts.rubik(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          // top: 10,
                          child: Icon(
                            Icons.lock_outline_rounded,
                            size: 25,
                            color: Colors.white,
                          ))
                    ]),
                    Spacer(),
                    Stack(children: [
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
                                    child: Icon(Icons.diamond_outlined,
                                        color: const Color.fromARGB(
                                            255, 215, 218, 221),
                                        size: 50)),
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
                      Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          // top: 10,
                          child: Icon(
                            Icons.lock_outline_rounded,
                            size: 25,
                            color: Colors.white,
                          ))
                    ]),
                    Spacer(),
                    Stack(children: [
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
                                  Icons.token_outlined,
                                  size: 40,
                                  color: Color.fromARGB(255, 215, 218, 221),
                                )),
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
                      Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          // top: 10,
                          child: Icon(
                            Icons.lock_outline_rounded,
                            size: 25,
                            color: Colors.white,
                          ))
                    ]),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
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
                                color: const Color.fromARGB(255, 215, 218, 221),
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
                                          255, 215, 218, 221),
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
                                color: Color.fromARGB(255, 215, 218, 221),
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
              ),
              // SizedBox(
              //   height: 10,
              // ),
              Padding(
                padding: const EdgeInsets.all(20.0),
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
                                Icons.stars_outlined,
                                size: 40,
                                color: const Color.fromARGB(255, 215, 218, 221),
                              )),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Road to FitPro',
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
                                  child: Icon(Icons.diamond_outlined,
                                      color: const Color.fromARGB(
                                          255, 215, 218, 221),
                                      size: 50)),
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
                                Icons.token_outlined,
                                size: 40,
                                color: Color.fromARGB(255, 215, 218, 221),
                              )),
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
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
