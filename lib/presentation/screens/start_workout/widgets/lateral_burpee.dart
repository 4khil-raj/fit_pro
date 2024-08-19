// ignore_for_file: prefer_const_constructors

import 'package:fit_pro/application/category_bloc/category_fetch_bloc.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/sub_pages/featured_plans/widgets/daily_task_builder.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/widget/populate_workout_builder.dart';
import 'package:fit_pro/presentation/screens/start_workout/widgets/buttons.dart';
import 'package:fit_pro/presentation/screens/start_workout/widgets/carousel.dart';
import 'package:fit_pro/presentation/screens/start_workout/widgets/check_box_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

int i = 0;
List<Map<String, dynamic>> flattenedExercises = [];

class LateralBurpeeScreen extends StatelessWidget {
  LateralBurpeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryFetchBloc, CategoryFetchState>(
      builder: (context, state) {
        flattenedExercises.clear();
        if (state is CategoryFetched) {
          i = state.index;

// Ensure exerciseList is not null
          if (exerciseList != null) {
            // Print the exerciseList to debug
            print('exerciseList: $exerciseList');

            // Flatten the exerciseList if it's a nested list
            for (var item in exerciseList) {
              print(
                  'Item: $item'); // Print each item to check its type and contents
              if (item is Map<String, dynamic>) {
                flattenedExercises.add(item);
              } else if (item is List) {
                // If item is a nested list, you may need to flatten further
                for (var subItem in item) {
                  if (subItem is Map<String, dynamic>) {
                    flattenedExercises.add(subItem);
                  }
                }
              }
            }
          } else {
            print('exerciseList is null');
          }

// Print the flattenedExercises to check the result
          print('flattenedExercises: $flattenedExercises');

          // Ensure the list is not empty and index is within bounds
          if (flattenedExercises.isNotEmpty &&
              i >= 0 &&
              i < flattenedExercises.length) {
            return Scaffold(
              backgroundColor: const Color.fromARGB(255, 6, 2, 19),
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: const Color.fromARGB(255, 6, 2, 19),
                iconTheme: IconThemeData(
                    color: const Color.fromARGB(255, 255, 255, 255)),
                title: Column(
                  children: [
                    Text(
                      flattenedExercises[state.index]['name'] ?? 'Unknown',
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Exercise ${state.index + 1} of ${flattenedExercises.length}",
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: const Color.fromARGB(255, 216, 210, 210),
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              // Uncomment and complete body as needed
              body: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  CarouselForWorkout(
                    video: flattenedExercises[i]
                        ['video_url'], // Ensure key name matches
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
          } else {
            return Scaffold(
              backgroundColor: const Color.fromARGB(255, 6, 2, 19),
              body: Center(
                child: Text(
                  'No data available or invalid index',
                  style: GoogleFonts.poppins(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
              ),
            );
          }
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
