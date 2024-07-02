import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BodyTrsformationCarouselPage extends StatefulWidget {
  const BodyTrsformationCarouselPage({super.key});

  @override
  State<BodyTrsformationCarouselPage> createState() =>
      _CarouselPremiumPageState();
}

class _CarouselPremiumPageState extends State<BodyTrsformationCarouselPage> {
  List containers = [
    "https://hips.hearstapps.com/hmg-prod/images/gettyimages-1673453535.jpg?crop=0.72xw:1xh;center,top&resize=640:*",
    "https://pbs.twimg.com/profile_images/1634062009435054081/2BCNlf4i_400x400.jpg",
    "https://rukminim2.flixcart.com/image/850/1000/kz4gh3k0/sticker/f/z/9/medium-bodybuilding-fitness-workout-gym-body-builder-original-imagb7a8hgn5rpah.jpeg?q=90&crop=false"
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
            height: 500, // Adjust height as needed
            initialPage: 0,
            // autoPlay: true,
            autoPlayInterval:
                const Duration(seconds: 10), // Slide every 10 seconds
            autoPlayAnimationDuration:
                const Duration(milliseconds: 900), // Animation duration
            viewportFraction: .8,
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
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  // height: 500,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(containers[index])),
                      borderRadius: BorderRadius.circular(5)),
                ));
          },
        ),
      ],
    );
  }
}
