import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuickTrainingScreen extends StatelessWidget {
  const QuickTrainingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 14, right: 13),
          child: Row(
            children: [
              Text(
                "Featured Training",
                style: GoogleFonts.urbanist(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              Spacer(),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "See all",
                    style: TextStyle(color: Colors.blue),
                  ))
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  height: 200,
                  width: 180,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.crunch.com.au%2Fwp-content%2Fuploads%2F2019%2F08%2Fblog-image.jpg&f=1&nofb=1&ipt=677768f6073bb0a0277f2681ec875e5617cdbc5c9eedd511f9c56fb81e72dc27&ipo=images")),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 200,
                  width: 180,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi.pinimg.com%2Foriginals%2F7d%2F85%2F10%2F7d8510f710381454aab80daedf888043.jpg&f=1&nofb=1&ipt=34627a94eb3a7e667cea2f94ef589cee9ed7a90da628712402256ab021eb0577&ipo=images")),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  height: 200,
                  width: 180,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fc.wallhere.com%2Fphotos%2F9f%2F8e%2Ffitness_model_weightlifting_women_model_sport_sports_ponytail-47955.jpg!d&f=1&nofb=1&ipt=7f7866fadf3209058418d9836ea681fc015b2a2be45ce8d68d2c72f7eb097333&ipo=images")),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
