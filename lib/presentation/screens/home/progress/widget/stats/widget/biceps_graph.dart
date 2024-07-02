import 'package:fit_pro/presentation/screens/home/progress/widget/stats/widget/biceps_graph_widget.dart';
import 'package:fit_pro/presentation/screens/home/progress/widget/stats/widget/weight_graph_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void bicepsGraph(context) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
            initialChildSize: .9,
            minChildSize: 0.4,
            maxChildSize: .9,
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
                        child: SingleChildScrollView(
                            controller: scrollController,
                            child: Column(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 64, 64, 64),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                    ),
                                  ),
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
                                          padding: const EdgeInsets.all(15.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                "History",
                                                style: GoogleFonts.poppins(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              Spacer(),
                                              Icon(CupertinoIcons.delete,
                                                  color: Colors.red)
                                            ],
                                          ),
                                        ),
                                        BicepsGraphWidget(),
                                      ]),
                                ),
                                BicepsPickerInProgressScreen()
                              ],
                            ))));
              });
            });
      });
}
