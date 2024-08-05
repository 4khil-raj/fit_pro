import 'package:fit_pro/application/category_bloc/category_fetch_bloc.dart';
import 'package:fit_pro/application/fetch_bookmark_day/fetch_bookmark_bloc.dart';
import 'package:fit_pro/application/plan_overview/plan_overview_bloc.dart';
import 'package:fit_pro/domain/models/workout_plans/model.dart';
import 'package:fit_pro/presentation/screens/bottom_nav/bottom_nav.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/sub_pages/featured_plans/widgets/daily_bookmar.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/sub_pages/featured_plans/widgets/plan_overview.dart';
import 'package:fit_pro/presentation/widgets/custom_nav/customnav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class FeturedPlansSubScreen extends StatelessWidget {
  const FeturedPlansSubScreen(
      {super.key,
      this.list,
      required this.bookmark,
      this.bookmarkState,
      required this.trending});
  final List<WorkoutPlanModel>? list;
  final bool bookmark;
  final FetchedDone? bookmarkState;
  final bool trending;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 6, 2, 19),
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: constBottomnavColor,
          title: Text(
            trending
                ? "Trending WorkOut"
                : bookmark
                    ? "Bookmarks"
                    : "Featured Plan",
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
                    return const Divider(
                      color: Colors.white,
                      thickness: .3,
                    );
                  },
                  itemCount: bookmark
                      ? bookmarkState!.list[0].bookmarks.length
                      : list!.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        bookmark
                            ? dailyTask(index, context)
                            : overViewScreen(index, context);
                      },
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
                                  fit: BoxFit.cover,
                                  bookmark
                                      ? bookmarkState!.list[0].bookmarks[index]
                                          .dayBannerImage
                                      : list![index].bannerImage),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2.5,
                                child: Text(
                                  bookmark
                                      ? bookmarkState!
                                          .list[0].bookmarks[index].dayName
                                      : list![index].planName,
                                  style: GoogleFonts.urbanist(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.blue),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                bookmark
                                    ? bookmarkState!
                                        .list[0].bookmarks[index].dayOfWeek
                                    : list![index].trainingType,
                                style: GoogleFonts.urbanist(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              SizedBox(
                                  width: 180,
                                  child: Text(
                                      bookmark
                                          ? bookmarkState!
                                              .list[0]
                                              .bookmarks[index]
                                              .estimatedDuration
                                          : list![index].workoutKeywords,
                                      style: GoogleFonts.urbanist(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13,
                                          color: const Color.fromARGB(
                                              255, 220, 212, 212))))
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

  void overViewScreen(int index, context) {
    BlocProvider.of<PlanOverviewBloc>(context)
        .add(PlanOverViewRequestEvent(planId: list![index].id));

    customNavPush(
        context,
        FeaturedPlanOverviewScreen(
          description: list![index].description,
          video: list![index].planVideo,
          task: list![index].workoutKeywords,
          image: list![index].bannerImage,
          title: list![index].planName,
          subTitle: list![index].trainingType,
        ));
  }

  void dailyTask(int index, context) async {
    BlocProvider.of<CategoryFetchBloc>(context).add(CategoryFetchReq(
        id: bookmarkState!.list[0].bookmarks[index].categories[index]));
    customNavPush(
        context,
        BookmarkDayTaskScreen(
          categoryId: bookmarkState!.list[0].bookmarks[index].categories[index],
          bookmarkIndex: index,
          subTitle: bookmarkState!.list[0].bookmarks[index].estimatedDuration,
          title: bookmarkState!.list[0].bookmarks[index].dayName,
          videoLink: bookmarkState!.list[0].bookmarks[index].introVideo,
        ));
  }
}
