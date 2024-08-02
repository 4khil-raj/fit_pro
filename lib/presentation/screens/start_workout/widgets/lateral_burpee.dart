// ignore_for_file: prefer_const_constructors

import 'package:fit_pro/application/category_bloc/category_fetch_bloc.dart';
import 'package:fit_pro/presentation/screens/start_workout/widgets/buttons.dart';
import 'package:fit_pro/presentation/screens/start_workout/widgets/carousel.dart';
import 'package:fit_pro/presentation/screens/start_workout/widgets/check_box_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class LateralBurpeeScreen extends StatelessWidget {
  LateralBurpeeScreen({super.key});
  String title = 'title';
  String exno = 'title';
  String total = 'title';
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 6, 2, 19),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 6, 2, 19),
        iconTheme:
            IconThemeData(color: const Color.fromARGB(255, 255, 255, 255)),
        title: Column(
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                  color: Colors.white, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Execise $exno of $total",
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 216, 210, 210),
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
      body: BlocBuilder<CategoryFetchBloc, CategoryFetchState>(
        builder: (context, state) {
          if (state is CategoryFetched) {
            title = state.list[0].exercises[i].name;
            exno = state.list[0].exercises[i].exerciseNumber.toString();
            total = state.list[0].exercises.length.toString();
            return Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                CarouselForWorkout(
                  video: state.list[0].exercises[i].videoUrl,
                ),
                Expanded(
                  child: CheckBoxSetRows(
                    state: state,
                  ),
                ),
                // Spacer(),
                TickButtonForLateralBurpee()
                //
              ],
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
