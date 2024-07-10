import 'package:carousel_slider/carousel_slider.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/widget/carouser_container1.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/widget/carouser_container2.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/widget/carouser_container3.dart';
import 'package:fit_pro/presentation/screens/start_workout/widgets/carousel_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarouselForWorkout extends StatefulWidget {
  const CarouselForWorkout({super.key});

  @override
  State<CarouselForWorkout> createState() => _CarouselPremiumPageState();
}

class _CarouselPremiumPageState extends State<CarouselForWorkout> {
  List containers = [
    const StartWorkoutCaroselcontainer1(),
    const StartWorkoutCaroselcontainer1()
  ];
  int sliderIndex = 0;
  final CarouselController _carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: _carouselController,
          options: CarouselOptions(
            // enableInfiniteScroll: false,
            // animateToClosest: true,
            // disableCenter: true,
            enlargeCenterPage: true,
            height: 250, // Adjust height as needed
            initialPage: 0,
            autoPlay: true,
            autoPlayInterval:
                const Duration(seconds: 10), // Slide every 10 seconds
            autoPlayAnimationDuration:
                const Duration(milliseconds: 900), // Animation duration
            viewportFraction: 0.8,
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
