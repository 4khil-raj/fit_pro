import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeaturedWorkoutsScreen extends StatelessWidget {
  const FeaturedWorkoutsScreen({super.key});

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
                "Trending Workouts",
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
                            "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi.pinimg.com%2F736x%2Fa0%2Ffc%2F3f%2Fa0fc3f5d9a25b2b441bea0000c3b62f4.jpg&f=1&nofb=1&ipt=b284be217464826c0a8dab316a25c8b1f52fb8c2300e45f0963ccf2d5507a223&ipo=images")),
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
                            "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fkeralainsider.com%2Fwp-content%2Fuploads%2F2020%2F09%2F96732949_1152144441796326_1243005168103600236_n-1024x1280.jpg&f=1&nofb=1&ipt=3b6fe591f7c2725a0bb6da07bbafa7362986d5022c08399d3ec73c680bb0e425&ipo=images")),
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
                            "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fimages3.alphacoders.com%2F107%2F1079633.jpg&f=1&nofb=1&ipt=4a2f17d890b664a2a5b29a73d65267c10c178324a0b82f410170968c1ae941e1&ipo=images")),
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
