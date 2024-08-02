import 'package:fit_pro/application/category_bloc/category_fetch_bloc.dart';
import 'package:fit_pro/presentation/screens/start_workout/widgets/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckBoxSetRows extends StatelessWidget {
  const CheckBoxSetRows({super.key, required this.state});
  final CategoryFetched state;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => weightAndReps(context,index),
      child: SizedBox(
        // height: MediaQuery.of(context).size.height / 2,
        child: ListView.builder(
            itemCount: state.list[0].exercises.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                    top: 30, bottom: 20, left: 30, right: 30),
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
                          state.list[0].exercises[index].sets.toString(),
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
                    InkWell(
                      onTap: () => weightAndReps(context, index),
                      child: Row(
                        children: [
                          Text(
                            "20",
                            style: GoogleFonts.poppins(
                                color: Colors.blue,
                                fontWeight: FontWeight.w600),
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
                    ),
                    InkWell(
                      onTap: () => weightAndReps(context, index),
                      child: Row(
                        children: [
                          Text(
                            "10",
                            style: GoogleFonts.poppins(
                                color: Colors.blue,
                                fontWeight: FontWeight.w600),
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
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
