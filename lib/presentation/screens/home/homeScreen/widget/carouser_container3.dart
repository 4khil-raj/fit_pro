import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeCaroselcontainer3 extends StatelessWidget {
  const HomeCaroselcontainer3({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: MediaQuery.of(context).size.width,
        height: 200,
        decoration: BoxDecoration(
            image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/images/carosel3.jpg",
                )),
            borderRadius: BorderRadius.circular(20)),
      ),
      Positioned(
          bottom: 45,
          right: 75,
          child: Column(
            children: [
              Text(
                "Increse Strength",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w800,
                    fontSize: 17,
                    color: Colors.white),
              ),
              Text(
                "3 week | 40 min | Arms | Back",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.white),
              )
            ],
          ))
    ]);
  }
}
