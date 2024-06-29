import 'package:fit_pro/presentation/widgets/dotted_container/dotted.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class BeforeAfterImageAddingProgress extends StatelessWidget {
  const BeforeAfterImageAddingProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.all(14.0),
        child: Text(
          "Before & After",
          style: GoogleFonts.poppins(
              fontSize: 17, fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
      Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 53, 53, 53),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomPaint(
                        painter: DottedBorderPainter(
                          color: const Color.fromARGB(255, 76, 108, 135),
                          strokeWidth: 2.0,
                          dashLength: 10.0,
                          spaceLength: 3.0,
                        ),
                        child: Container(
                          // width: 200,
                          height: 230,
                          alignment: Alignment.center,
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_a_photo_outlined,
                                size: 35,
                                color: Color.fromARGB(255, 80, 168, 240),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                " Add",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 208, 202, 202)),
                              ),
                              Text(
                                " before image",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 208, 202, 202)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomPaint(
                        painter: DottedBorderPainter(
                          color: const Color.fromARGB(255, 76, 108, 135),
                          strokeWidth: 2.0,
                          dashLength: 10.0,
                          spaceLength: 3.0,
                        ),
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          // width: 200,
                          height: 230,
                          alignment: Alignment.center,
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_a_photo_outlined,
                                size: 35,
                                color: Color.fromARGB(255, 80, 168, 240),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                " Add",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 208, 202, 202)),
                              ),
                              Text(
                                " after image",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 208, 202, 202)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "BEFORE",
                          style: GoogleFonts.urbanist(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        "May, 2024",
                        style: GoogleFonts.rubik(color: Colors.white54),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "AFTER",
                          style: GoogleFonts.urbanist(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        "",
                        style: GoogleFonts.rubik(color: Colors.white54),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    ]);
  }
}
