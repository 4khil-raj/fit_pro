// ignore_for_file: prefer_const_constructors

import 'package:fit_pro/application/category_bloc/category_fetch_bloc.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/sub_pages/featured_plans/widgets/daily_task_builder.dart';
import 'package:fit_pro/presentation/screens/start_workout/widgets/buttons.dart';
import 'package:fit_pro/presentation/screens/start_workout/widgets/carousel.dart';
import 'package:fit_pro/presentation/screens/start_workout/widgets/check_box_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

int i = 0;

class LateralBurpeeScreen extends StatelessWidget {
  LateralBurpeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryFetchBloc, CategoryFetchState>(
      builder: (context, state) {
        if (state is CategoryFetched) {
          i = state.index;
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 6, 2, 19),
            appBar: AppBar(
              // leading: IconButton(
              //   icon: Icon(Icons.arrow_back),
              //   onPressed: () {
              //     Navigator.pop(context);
              //     Navigator.pop(context);
              //   },
              // ),
              centerTitle: true,
              backgroundColor: const Color.fromARGB(255, 6, 2, 19),
              iconTheme: IconThemeData(
                  color: const Color.fromARGB(255, 255, 255, 255)),
              title: Column(
                children: [
                  Text(
                    exerciseData[state.index].name,
                    style: GoogleFonts.poppins(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Execise ${exerciseData[state.index].exerciseNumber} of ${exerciseData.length}",
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: const Color.fromARGB(255, 216, 210, 210),
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            body: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                CarouselForWorkout(
                  video: exerciseData[i].videoUrl,
                ),
                Expanded(
                  child: CheckBoxSetRows(),
                ),
                // Spacer(),
                TickButtonForLateralBurpee(
                  categoryState: state,
                )
                //
              ],
            ),
          );
        }
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 6, 2, 19),
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
