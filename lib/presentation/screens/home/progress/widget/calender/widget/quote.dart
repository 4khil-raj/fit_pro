import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TodayQuoteScreenProgress extends StatelessWidget {
  const TodayQuoteScreenProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(11.0),
          child: Row(
            children: [
              Text(
                'Today\'s Quote',
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
          child: Container(
            clipBehavior: Clip.antiAlias,
            height: 400,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://m.media-amazon.com/images/I/51sbnUqevKL._AC_UF894,1000_QL80_.jpg"))),
          ),
        ),
      ],
    );
  }
}
