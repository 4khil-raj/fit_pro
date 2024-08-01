import 'package:fit_pro/application/workout_fetch/workoutfetch_bloc.dart';
import 'package:fit_pro/presentation/screens/bottom_nav/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkoutListScreens extends StatelessWidget {
  const WorkoutListScreens({
    super.key,
    required this.state,
  });

  final WorkoutFetchDone state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 6, 2, 19),
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: constBottomnavColor,
          title: Text(
            "Featured/Trending Workout",
            style: GoogleFonts.poppins(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
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
                  itemCount: state.list.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        // bookmark
                        //     ? dailyTask(index, context)
                        //     : overViewScreen(index, context);
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
                                  state.list[index].bannerImage),
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
                                  state.list[index].workoutName,
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
                                state.list[index].estimatedDuration,
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
                                  child: Text(state.list[index].workoutKeywords,
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
    // BlocProvider.of<PlanOverviewBloc>(context)
    //     .add(PlanOverViewRequestEvent(planId: list![index].id));

    // customNavPush(
    //     context,
    //     FeaturedPlanOverviewScreen(
    //       description: list![index].description,
    //       video: list![index].planVideo,
    //       task: list![index].workoutKeywords,
    //       image: list![index].bannerImage,
    //       title: list![index].planName,
    //       subTitle: list![index].trainingType,
    //     ));
  }

  void dailyTask(int index, context) async {
    // BlocProvider.of<CategoryFetchBloc>(context).add(CategoryFetchReq(
    //     id: state!.list[0].bookmarks[index].categories[index]));
    // customNavPush(
    //     context,
    //     BookmarkDayTaskScreen(
    //       bookmarkIndex: index,
    //       subTitle: state!.list[0].bookmarks[index].estimatedDuration,
    //       title: state!.list[0].bookmarks[index].dayName,
    //       videoLink: state!.list[0].bookmarks[index].introVideo,
    //     ));
  }
}
