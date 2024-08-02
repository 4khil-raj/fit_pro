import 'package:carousel_slider/carousel_slider.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/widget/carouser_container1.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/widget/carouser_container2.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/widget/carouser_container3.dart';
import 'package:fit_pro/presentation/screens/start_workout/widgets/carousel_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarouselForWorkout extends StatefulWidget {
  const CarouselForWorkout({super.key, required this.video});
  final String video;
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
    return StartWorkoutCaroselcontainer1();
  }
}
