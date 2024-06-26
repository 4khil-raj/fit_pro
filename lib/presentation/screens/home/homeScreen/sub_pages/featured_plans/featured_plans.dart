import 'package:fit_pro/presentation/screens/bottom_nav/bottom_nav.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/sub_pages/featured_plans/widgets/plan_overview.dart';
import 'package:fit_pro/presentation/widgets/custom_nav/customnav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class FeturedPlansSubScreen extends StatelessWidget {
  FeturedPlansSubScreen({super.key});
  List<String> image = [
    "https://s1.1zoom.me/b5050/856/Fitness_Dumbbells_482980_3840x2400.jpg",
    'https://connectedwomanmag.com/wp-content/uploads/2016/02/fitness-2.jpg',
    'https://1.bp.blogspot.com/-ffpnoeYTlfo/XxvAFbipiaI/AAAAAAAAEsM/syzGlnNtKwsdbnn0EuwtIFvRC6C9W62NACLcBGAsYHQ/s2048/Home%2Bfitness%2Bexercise.jpg',
    'https://besthqwallpapers.com/Uploads/31-3-2018/46611/gym-training-exercise-with-weight-bodybuilding-dumbbell.jpg',
    "https://nypost.com/wp-content/uploads/sites/2/2020/12/home-workout-equipment.jpg?quality=80&strip=all",
    "https://i2.wp.com/run-for-good.com/wp-content/uploads/2017/03/medicineball.jpg?fit=1200%2C1200"
  ];
  List<String> title = [
    "Weightligting",
    'Booty Training',
    'Plyometrics',
    'Athletic Training',
    'Plyometrics',
    "Plyometrics"
  ];
  List<String> subTitle = [
    "14 Day Challenge",
    'Booty Training',
    '21 Day Challenge ',
    "Sync & Flow",
    '90 Day Beginner Challenge',
    "14 Day Challenge"
  ];

  List<String> task = [
    "2 Week | 4 Times/Week | GYM | Intermediate | Athletic Training",
    "2 Week | 4 Times/Week | GYM | Beginner",
    '3 Week | 4 Times/Week | GYM | Expert | Athletic Training',
    '2 Week | 4 Times/Week | GYM | Beginner  | Athletic Training',
    "12 Week | 4 Times/Week | GYM | Expert | Athletic Training",
    '2 Week | 4 Times/Week | GYM | Intermediate | Athletic Training'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 6, 2, 19),
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: constBottomnavColor,
          title: Text(
            "Featured Plan",
            style: GoogleFonts.poppins(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors.white,
                      thickness: .3,
                    );
                  },
                  itemCount: image.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => customNavPush(
                          context,
                          FeaturedPlanOverviewScreen(
                            task: task[index],
                            image: image[index],
                            title: title[index],
                            subTitle: subTitle[index],
                          )),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(11)),
                              height: 130,
                              width: 140,
                              child: Image.network(
                                  fit: BoxFit.cover, image[index]),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title[index],
                                style: GoogleFonts.urbanist(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.blue),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                subTitle[index],
                                style: GoogleFonts.urbanist(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              SizedBox(
                                width: 180,
                                child: Text(
                                  task[index],
                                  style: GoogleFonts.urbanist(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13,
                                      color:
                                          Color.fromARGB(255, 220, 212, 212)),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
