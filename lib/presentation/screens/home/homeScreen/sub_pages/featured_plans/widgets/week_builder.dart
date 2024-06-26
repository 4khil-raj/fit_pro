import 'package:fit_pro/presentation/screens/home/homeScreen/sub_pages/featured_plans/widgets/day_task.dart';
import 'package:fit_pro/presentation/widgets/custom_nav/customnav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class WeekOneBuilder extends StatelessWidget {
  WeekOneBuilder({Key? key}) : super(key: key);

  final List<String> images = [
    "assets/images/carosel3.jpg",
    "assets/images/7df90fdb-01a8-49d7-bfb1-668c8d849ef0.jpg",
    "assets/images/carosel.jpg",
    "assets/images/trending_caro2.jpg",
    "assets/images/trending_image1.jpg",
    "assets/icons/workout.jpg",
    "assets/images/trending_caro2.jpg"
  ];
  final List<String> title = [
    "Day 01",
    "Day 02",
    "Day 03",
    "Day 04",
    "Day 05",
    "Day 06",
    "Day 07"
  ];
  final List<String> subTitle = [
    "Ovulation Week: Metabolic Booster",
    'Back, Shoulders & Triceps',
    "Abs, Biceps & Calves",
    "Back, Shoulders & Triceps",
    "Abs, Biceps & Calves",
    "Back, Shoulders & Triceps",
    "Abs, Biceps & Calves"
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                customNavPush(
                    context,
                    DayTaskScreen(
                      title: subTitle[index],
                      subtitle: "Day 1 | Metabolic Booster",
                      appbarTitle: "Week 1 | ${title[index]}",
                    ));
              },
              child: Container(
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 350, // Set a height for the container
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(images[index]),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    Positioned(
                      bottom: 19,
                      left: 19,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title[index],
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w900,
                              fontSize: 18,
                              color: const Color.fromARGB(255, 12, 144, 252),
                            ),
                          ),
                          const SizedBox(height: 6),
                          SizedBox(
                            width: 300,
                            child: Text(
                              subTitle[index],
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w800,
                                fontSize: 17,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          // Text(
                          //   subTitle[index],
                          //   style: GoogleFonts.poppins(
                          //     fontWeight: FontWeight.w600,
                          //     fontSize: 14,
                          //     color: Colors.white,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
