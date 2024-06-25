import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TrendingCaroselContainer2 extends StatelessWidget {
  const TrendingCaroselContainer2({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: MediaQuery.of(context).size.width,
        // height: 200,
        decoration: BoxDecoration(
            image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/images/trending_caro2.jpg",
                )),
            borderRadius: BorderRadius.circular(8)),
      ),
      Positioned(
          bottom: 19,
          left: 19,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Weightligting",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w900,
                    fontSize: 14,
                    color: const Color.fromARGB(255, 12, 144, 252)),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                "14 Day Challenge",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w800,
                    fontSize: 17,
                    color: Colors.white),
              ),
              Text(
                "2 Week | GYM",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.white),
              )
            ],
          )),
      Positioned(
          top: 16,
          right: 25,
          child: Row(
            children: [
              Icon(
                Icons.favorite,
                color: Colors.red,
                size: 18,
              ),
              Text(
                " 30k",
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              )
            ],
          ))
    ]);
  }
}
