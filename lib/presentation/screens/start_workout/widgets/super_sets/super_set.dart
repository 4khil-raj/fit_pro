import 'package:fit_pro/application/category_bloc/category_fetch_bloc.dart';
import 'package:fit_pro/presentation/screens/start_workout/widgets/carousel.dart';
import 'package:fit_pro/presentation/screens/start_workout/widgets/lateral_burpee.dart';
import 'package:fit_pro/presentation/screens/start_workout/widgets/super_sets/check_box.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SuperSetScreen extends StatelessWidget {
  const SuperSetScreen({super.key, required this.categoryState});
  final CategoryFetched categoryState;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 6, 2, 19),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 6, 2, 19),
        iconTheme:
            const IconThemeData(color: Color.fromARGB(255, 255, 255, 255)),
        title: Column(
          children: [
            Text(
              categoryState.list[0].exercises[i].name,
              style: GoogleFonts.poppins(
                  color: Colors.white, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Execise ${categoryState.list[0].exercises[i].exerciseNumber} of ${categoryState.list.length}",
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 216, 210, 210),
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          CarouselForWorkout(
            video: categoryState.list[0].exercises[i].videoUrl,
          ),
          Padding(
            padding: const EdgeInsets.all(11.0),
            child: Text(
              'Superset',
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 18),
            ),
          ),
          const CheckBoxRowSuperSet()
        ],
      ),
    );
  }
}
