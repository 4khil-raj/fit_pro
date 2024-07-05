import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlanProgressTopImage extends StatelessWidget {
  const PlanProgressTopImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 160,
        decoration: const BoxDecoration(
            image: DecorationImage(
                opacity: .4,
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://lh6.googleusercontent.com/JF3uCNfv9K1TwPadKXldU7nvcQLf2vKKyMzOI9onNpVyeSaJ8H4Kwt2Mx15mSSPB_s3XQnfNfaqjcmMshjrei3G2pkrYHEVp1O-WPWLCOuETwJoGBItEbiNWUIiM2_3rLsU0VwnwhhZojSJq8ZMl92A"))),
      ),
      Positioned(
          top: 0,
          bottom: 0,
          left: 1,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "2 Week Challlenge",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                    const Text(
                      "Weightligting",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                const Spacer(),
                Container(
                  height: 30,
                  width: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            color: Colors.green,
                            value: .6,
                            strokeWidth: 2.0,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text("3 %")
                      ],
                    ),
                  ),
                )
              ],
            ),
          ))
    ]);
  }
}
