import 'package:fit_pro/presentation/screens/home/profile/widget/squre_container.dart';
import 'package:fit_pro/presentation/screens/home/progress/widget/stats/widget/achievemnts.dart';
import 'package:fit_pro/presentation/screens/home/progress/widget/stats/widget/before_after.dart';
import 'package:fit_pro/presentation/screens/home/progress/widget/stats/widget/body_trasformation.dart';
import 'package:fit_pro/presentation/screens/home/progress/widget/stats/widget/measurements.dart';
import 'package:fit_pro/presentation/screens/home/progress/widget/stats/widget/top_buttons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StatsScreenProgress extends StatelessWidget {
  const StatsScreenProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // height: 150,
            color: const Color.fromARGB(255, 53, 53, 53),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi.pinimg.com%2F736x%2F2d%2F00%2F35%2F2d003500486fc421f3497197689a7e06.jpg&f=1&nofb=1&ipt=9fad4b1450c71582ea96205d0b52c75334c0af16c8f6219e2c802ea4bcb57505&ipo=images",
                      ),
                      radius: 50,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Balam Rawat",
                        style: GoogleFonts.rubik(
                            fontSize: 20,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                      Text(
                        "104 Days on Fit Pro",
                        style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 211, 202, 202)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const ProgressScreenTopButtons(),
          ProfileSqureContainer(),
          BeforeAfterImageAddingProgress(),
          const SizedBox(
            height: 20,
          ),
          AchievementsWidgetProgressScreen(),
          MeasurementsWidgetProgressScreen(),
          BodyTrasformationWidgetProgressScreen()
        ],
      ),
    );
  }
}
