import 'package:carousel_slider/carousel_slider.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/sub_pages/featured_plans/featured_plans.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/sub_pages/featured_plans/widgets/carosel_container.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/sub_pages/featured_plans/widgets/day_task.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/sub_pages/featured_plans/widgets/week1.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/widget/bottom_caro_container1.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/widget/bottom_caro_container2.dart';
import 'package:fit_pro/presentation/widgets/custom_nav/customnav.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeekOneCarouselSlider extends StatefulWidget {
  const WeekOneCarouselSlider({super.key});

  @override
  State<WeekOneCarouselSlider> createState() => _BottomCaroselSliderState();
}

class _BottomCaroselSliderState extends State<WeekOneCarouselSlider> {
  List containers = [
    FeaturedCaroselContainer1(
      text: "Day 01",
      text2: "Ovulation Week: Metabolic Booster",
      text3: "",
      image: "assets/images/week1.2.webp",
    ),
    FeaturedCaroselContainer1(
      text: "Day 02",
      text2: "Ovulation Week: Metabolic Booster",
      text3: "",
      image: "assets/images/carosel.jpg",
    ),
    // const HomeCaroselcontainer3()
  ];
  int sliderIndex = 0;
  final CarouselController _carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 13.0, bottom: 13, top: 10),
          child: Row(
            children: [
              Text(
                "Week 01 ",
                style: GoogleFonts.urbanist(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              const Spacer(),
              TextButton(
                  onPressed: () => customNavPush(
                      context,
//ee screen figmayil illah ahh thanna pottane pattikkan commentcheythaya ee screennine just call cheytha mmathi vere onnum cheyyanda aa screen cheytholum
                      //  const WeekOneScreen()

                      DayTaskScreen(
                        title: "Day 01",
                        subtitle: "Day 1 | Metabolic Booster",
                        appbarTitle: "Week 1 | Day1",
                      )),
                  child: const Text(
                    "see more",
                    style: TextStyle(color: Colors.blue),
                  ))
            ],
          ),
        ),
        CarouselSlider.builder(
          carouselController: _carouselController,
          options: CarouselOptions(
            // enableInfiniteScroll: false,
            // animateToClosest: true,
            // disableCenter: true,
            enlargeCenterPage: true,
            height: 370, // Adjust height as needed
            initialPage: 0,
            autoPlay: true,
            autoPlayInterval:
                const Duration(seconds: 10), // Slide every 10 seconds
            autoPlayAnimationDuration:
                const Duration(milliseconds: 900), // Animation duration
            viewportFraction: 0.9,
            // enableInfiniteScroll: false,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              setState(() {
                sliderIndex = index;
              });
            },
          ),
          itemCount: containers.length,
          itemBuilder: (context, index, realIndex) {
            return ClipRRect(
                borderRadius: BorderRadius.circular(1),
                child: containers[index]);
          },
        ),
        // const SizedBox(height: 30),
        // AnimatedSmoothIndicator(
        //   activeIndex: sliderIndex,
        //   count: 3,
        //   effect: const ExpandingDotsEffect(
        //     dotHeight: 8,
        //     dotWidth: 8,
        //     activeDotColor: Color.fromARGB(255, 255, 0, 0),
        //     dotColor: Color.fromARGB(255, 0, 0, 0),
        //   ),
        //   onDotClicked: (index) {
        //     _carouselController.animateToPage(index);
        //   },
        // ),
      ],
    );
  }
}
