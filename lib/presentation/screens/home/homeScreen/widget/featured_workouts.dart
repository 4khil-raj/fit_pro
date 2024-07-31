import 'package:fit_pro/application/workout_plans/workoutplans_bloc.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/sub_pages/featured_plans/featured_plans.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/sub_pages/featured_plans/widgets/plan_overview.dart';
import 'package:fit_pro/presentation/widgets/custom_nav/customnav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class FeaturedWorkoutsScreen extends StatelessWidget {
  const FeaturedWorkoutsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutplansBloc, WorkoutplansState>(
      builder: (context, state) {
        if (state is WorkoutplansFetchedSuccessState) {
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
                    const Spacer(),
                    TextButton(
                        onPressed: () => customNavPush(
                            context,
                            FeturedPlansSubScreen(
                              bookmark: false,
                              list: state.list,
                            )),
                        child: const Text(
                          "See all",
                          style: TextStyle(color: Colors.blue),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 210,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.list.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () => customNavPush(
                          context,
                          FeaturedPlanOverviewScreen(
                            description: state.list[index].description,
                            video: state.list[index].planVideo,
                            task: state.list[index].workoutKeywords,
                            image: state.list[index].bannerImage,
                            title: state.list[index].planName,
                            subTitle: state.list[index].trainingType,
                          )),
                      child: Container(
                        height: 200,
                        width: 180,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image:
                                  NetworkImage(state.list[index].bannerImage)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}
