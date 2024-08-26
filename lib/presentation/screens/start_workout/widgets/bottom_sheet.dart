import 'package:fit_pro/presentation/screens/start_workout/widgets/bottom_sheet_buttons.dart';
import 'package:fit_pro/presentation/screens/start_workout/widgets/picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void weightAndReps(context, index) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
            initialChildSize: 0.6,
            minChildSize: 0.6,
            maxChildSize: 0.6,
            expand: false,
            builder: (context, scrollController) {
              return LayoutBuilder(builder: (context, constraints) {
                final bottomPadding = MediaQuery.of(context).viewInsets.bottom;
                return AnimatedPadding(
                    padding: EdgeInsets.only(bottom: bottomPadding),
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                    child: Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 9, 3, 28),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SingleChildScrollView(
                                controller: scrollController,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            left: 170,
                                            right: 170,
                                            top: 8,
                                            bottom: 8),
                                        child: Divider(
                                          thickness: 4,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              " Reps",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 21,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              " Weight",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 21,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ],
                                        ),
                                      ),

                                      // const Row(
                                      //   crossAxisAlignment:
                                      //       CrossAxisAlignment.center,
                                      //   children: [
                                      //     Expanded(
                                      //         child: Column(
                                      //       children: [
                                      //         Padding(
                                      //           padding: EdgeInsets.all(12.0),
                                      //           child: Divider(),
                                      //         ),
                                      //         Padding(
                                      //           padding: EdgeInsets.all(12.0),
                                      //           child: Divider(),
                                      //         )
                                      //       ],
                                      //     )),
                                      //     SizedBox(
                                      //       width: 10,
                                      //     ),
                                      //     Expanded(
                                      //         child: Column(
                                      //       children: [
                                      //         Padding(
                                      //           padding: EdgeInsets.all(12.0),
                                      //           child: Divider(),
                                      //         ),
                                      //         Padding(
                                      //           padding: EdgeInsets.all(12.0),
                                      //           child: Divider(),
                                      //         )
                                      //       ],
                                      //     ))
                                      //   ],
                                      // )
                                      WeightAndRepsPickerScreen(
                                        index: index,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      BottomSheetButtons(
                                        index: index,
                                      )
                                    ])))));
              });
            });
      });
}
