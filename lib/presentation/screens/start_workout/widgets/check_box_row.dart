import 'package:fit_pro/presentation/screens/start_workout/widgets/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckBoxSetRows extends StatelessWidget {
  const CheckBoxSetRows({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => weightAndReps(context),
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 30, bottom: 20, left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.check_box_outline_blank_outlined,
                  color: Colors.white,
                ),
                Row(
                  children: [
                    Text(
                      "1",
                      style: GoogleFonts.poppins(
                          color: Colors.blue, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Text(
                      "Set",
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 12),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "20",
                      style: GoogleFonts.poppins(
                          color: Colors.blue, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Text(
                      "reps",
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 12),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "10",
                      style: GoogleFonts.poppins(
                          color: Colors.blue, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Text(
                      "kg",
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 12),
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.check_box_outline_blank_outlined,
                  color: Colors.white,
                ),
                Row(
                  children: [
                    Text(
                      "2",
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Text(
                      "Set",
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 12),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "20",
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Text(
                      "reps",
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 12),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "10",
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Text(
                      "kg",
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 12),
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.check_box_outline_blank_outlined,
                  color: Colors.white,
                ),
                Row(
                  children: [
                    Text(
                      "3",
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Text(
                      "Set",
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 12),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "20",
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Text(
                      "reps",
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 12),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "10",
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Text(
                      "kg",
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 12),
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.check_box_outline_blank_outlined,
                  color: Colors.white,
                ),
                Row(
                  children: [
                    Text(
                      "4",
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Text(
                      "Set",
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 12),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "20",
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Text(
                      "reps",
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 12),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "10",
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Text(
                      "kg",
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 12),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
