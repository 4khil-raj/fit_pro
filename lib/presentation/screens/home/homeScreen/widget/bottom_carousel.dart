import 'package:carousel_slider/carousel_slider.dart';
import 'package:fit_pro/application/plan_overview/plan_overview_bloc.dart';
import 'package:fit_pro/domain/models/workout_plans/model.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/sub_pages/featured_plans/featured_plans.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/sub_pages/featured_plans/widgets/plan_overview.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/widget/bottom_caro_container1.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/widget/bottom_caro_container2.dart';
import 'package:fit_pro/presentation/widgets/custom_nav/customnav.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomCaroselSlider extends StatefulWidget {
  final List<WorkoutPlanModel> list;
  const BottomCaroselSlider({super.key, required this.list});

  @override
  State<BottomCaroselSlider> createState() => _BottomCaroselSliderState();
}

class _BottomCaroselSliderState extends State<BottomCaroselSlider> {
  int sliderIndex = 0;
  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    List containers = [
      BottomCaroselContainer1(
        index: 0,
        list: widget.list,
      ),
      BottomCaroselcontainer2(list: widget.list),
      // const HomeCaroselcontainer3()
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 13.0, bottom: 13, top: 10),
          child: Row(
            children: [
              Text(
                "Featured Plans",
                style: GoogleFonts.urbanist(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              const Spacer(),
              TextButton(
                  onPressed: () => customNavPush(
                      context,
                      FeturedPlansSubScreen(
                        trending: false,
                        bookmark: false,
                        list: widget.list,
                      )),
                  child: const Text(
                    "See all",
                    style: TextStyle(color: Colors.blue),
                  ))
            ],
          ),
        ),

        SizedBox(
          height: 370,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.list.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  BlocProvider.of<PlanOverviewBloc>(context).add(
                      PlanOverViewRequestEvent(planId: widget.list[index].id));

                  customNavPush(
                      context,
                      FeaturedPlanOverviewScreen(
                        description: widget.list[index].description,
                        video: widget.list[index].planVideo,
                        task: widget.list[index].workoutKeywords,
                        image: widget.list[index].bannerImage,
                        title: widget.list[index].planName,
                        subTitle: widget.list[index].trainingType,
                      ));
                },
                child: BottomCaroselContainer1(
                  index: index,
                  list: widget.list,
                ),
              );
            },
          ),
        )
        // CarouselSlider.builder(
        //   carouselController: _carouselController,
        //   options: CarouselOptions(
        //     // enableInfiniteScroll: false,
        //     // animateToClosest: true,
        //     // disableCenter: true,
        //     enlargeCenterPage: true,
        //     height: 370, // Adjust height as needed
        //     initialPage: 0,
        //     autoPlay: true,
        //     autoPlayInterval:
        //         const Duration(seconds: 10), // Slide every 10 seconds
        //     autoPlayAnimationDuration:
        //         const Duration(milliseconds: 900), // Animation duration
        //     viewportFraction: 0.9,
        //     // enableInfiniteScroll: false,
        //     scrollDirection: Axis.horizontal,
        //     onPageChanged: (index, reason) {
        //       setState(() {
        //         sliderIndex = index;
        //       });
        //     },
        //   ),
        //   itemCount: containers.length,
        //   itemBuilder: (context, index, realIndex) {
        //     return ClipRRect(
        //         borderRadius: BorderRadius.circular(1),
        //         child: containers[index]);
        //   },
        // ),
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
