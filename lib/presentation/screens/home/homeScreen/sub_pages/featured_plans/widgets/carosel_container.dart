import 'package:fit_pro/application/plan_overview/plan_overview_bloc.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/sub_pages/featured_plans/widgets/day_task.dart';
import 'package:fit_pro/presentation/widgets/custom_nav/customnav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeaturedCaroselContainer1 extends StatelessWidget {
  FeaturedCaroselContainer1(
      {this.image,
      super.key,
      required this.text,
      required this.text2,
      required this.text3,
      required this.weekIndex,
      required this.dayIndex,
      required this.state});
  String? image;
  final String text;
  final String text2;
  final String text3;
  final int weekIndex;
  final int dayIndex;
  final PlanFetchDone state;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      InkWell(
        onTap: () => customNavPush(
            context,
//ee screen figmayil illah ahh thanna pottane pattikkan commentcheythaya ee screennine just call cheytha mmathi vere onnum cheyyanda aa screen cheytholum
            //  const WeekOneScreen()
            DayTaskScreen(
              bookmark: false,
              dayIndex: dayIndex,
              weekIndex: weekIndex,
              state: state,
              appbarTitle:
                  "Week ${state.list[0].weeks[weekIndex].week} | Day ${state.list[0].weeks[weekIndex].days[dayIndex].day}",
            )),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 370,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    image ?? "assets/icons/workout.jpg",
                  )),
              borderRadius: BorderRadius.circular(8)),
        ),
      ),
      Positioned(
          bottom: 19,
          left: 19,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                    color: const Color.fromARGB(255, 12, 144, 252)),
              ),
              const SizedBox(
                height: 6,
              ),
              SizedBox(
                width: 300,
                child: Text(
                  text2,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w800,
                      fontSize: 17,
                      color: Colors.white),
                ),
              ),
              Text(
                text3,
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
