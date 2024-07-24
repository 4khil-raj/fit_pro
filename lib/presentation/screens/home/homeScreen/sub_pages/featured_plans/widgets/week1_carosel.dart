import 'package:fit_pro/application/plan_overview/plan_overview_bloc.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/sub_pages/featured_plans/widgets/carosel_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeekOneCarouselSlider extends StatefulWidget {
  const WeekOneCarouselSlider({
    super.key,
    required this.state,
    required this.index,
  });
  final PlanFetchDone state;

  final int index;
  @override
  State<WeekOneCarouselSlider> createState() => _BottomCaroselSliderState();
}

class _BottomCaroselSliderState extends State<WeekOneCarouselSlider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 13.0, bottom: 13, top: 10),
          child: Row(
            children: [
              Text(
                "Week ${widget.state.list[0].weeks[widget.index].week} ",
                style: GoogleFonts.urbanist(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              const Spacer(),
//               TextButton(
//                   onPressed: () {
//                     // BlocProvider.of<FetchweekBloc>(context)
//                     //     .add(FetchWeekReq(weekId: widget.weekId));
//                     customNavPush(
//                         context,
// //ee screen figmayil illah ahh thanna pottane pattikkan commentcheythaya ee screennine just call cheytha mmathi vere onnum cheyyanda aa screen cheytholum
//                         //  const WeekOneScreen()
//                         DayTaskScreen(dayIndex: widget.,
//                           state: widget.state,

//                           appbarTitle: "Week 1 | Day1",
//                         ));
//                   },
//                   child: const Text(
//                     "see more",
//                     style: TextStyle(color: Colors.blue),
//                   ))
            ],
          ),
        ),
        SizedBox(
          height: 370,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.state.list[0].weeks[widget.index].days.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: FeaturedCaroselContainer1(
                    state: widget.state,
                    dayIndex: index,
                    weekIndex: widget.index,
                    text: widget
                        .state.list[0].weeks[widget.index].days[index].dayName,
                    text2: widget.state.list[0].weeks[widget.index].days[index]
                        .estimatedDuration,
                    text3: "",
                    image: widget.state.list[0].weeks[widget.index].days[index]
                        .dayBannerImage,
                  ),
                );
              }),
        ),
      ],
    );
  }
}
