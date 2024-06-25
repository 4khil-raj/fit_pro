import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class PhotoGalleryScreenHome extends StatelessWidget {
  const PhotoGalleryScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 14, right: 13),
          child: Row(
            children: [
              Text(
                "Photos Gallery",
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
        Container(
          height: 350,
          child: Row(
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://verv.com/wp-content/uploads/2018/12/seiza_pose-e1545294218881.jpg"))),
                ),
              )),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fmiosuperhealth.com%2Fwp-content%2Fuploads%2F2018%2F08%2F1502w-new-exercise-getty_0.jpg&f=1&nofb=1&ipt=c0471bb73a0d168e3ba424e08894577d31a33d0e57253665461761d4751b7e47&ipo=images"))),
                      ),
                    )),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ff.vividscreen.info%2Fsoft%2F62c1a9182c7bc1e2998f2f4d505bd1b4%2FFitness-Gym-Workout-1920x1080.jpg&f=1&nofb=1&ipt=e52e0d39485dc0a833aa144775dfc1978ce4b7e8d0ddbc013c80294886a7d616&ipo=images"))),
                      ),
                    ))
                  ],
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://s-i.huffpost.com/gen/1223926/images/o-YOGA-FOR-ENERGY-facebook.jpg")),
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(10)),
            height: 170,
          ),
        ),
        Container(
          height: 350,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "https://www.justrunlah.com/wp-content/uploads/2016/11/sport-girl-do-yoga-in-the-park-asian-beauty-woman.jpg"))),
                      ),
                    )),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "https://wallpapercave.com/wp/wp11451645.jpg"))),
                      ),
                    ))
                  ],
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://i.pinimg.com/originals/b9/f2/d4/b9f2d4ac3d1c353fb848508478e9e0ba.jpg"))),
                ),
              )),
            ],
          ),
        ),
      ],
    );
  }
}
