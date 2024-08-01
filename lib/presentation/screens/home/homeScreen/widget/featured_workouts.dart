import 'package:fit_pro/application/workout_fetch/workoutfetch_bloc.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/widget/workouts_list.dart';
import 'package:fit_pro/presentation/widgets/custom_nav/customnav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class FeaturedWorkoutsScreen extends StatelessWidget {
  const FeaturedWorkoutsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutfetchBloc, WorkoutfetchState>(
      builder: (context, state) {
        if (state is WorkoutFetchDone) {
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
                        onPressed: () {
                          customNavPush(
                              context,
                              WorkoutListScreens(
                                state: state,
                              ));
                        },
                        child: const Text(
                          "See all",
                          style: TextStyle(color: Colors.blue),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 214,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.list.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        // BlocProvider.of<PlanOverviewBloc>(context).add(
                        //     PlanOverViewRequestEvent(
                        //         planId: state.list[index].id));
                        // customNavPush(
                        //     context,
                        // FeaturedPlanOverviewScreen(
                        //       description: state.list[index].description,
                        //       video: state.list[index].planVideo,
                        //       task: state.list[index].workoutKeywords,
                        //       image: state.list[index].bannerImage,
                        //       title: state.list[index].planName,
                        //       subTitle: state.list[index].trainingType,
                        //     ));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 140,
                            width: 180,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      state.list[index].bannerImage)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0, top: 6),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.list[index].level,
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13,
                                      color: Colors.white),
                                ),
                                Text(
                                  state.list[index].estimatedDuration,
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11,
                                      color: const Color.fromARGB(
                                          255, 212, 209, 209)),
                                ),
                                Text(
                                  state.list[index].goalOrientation,
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11,
                                      color: const Color.fromARGB(
                                          255, 212, 209, 209)),
                                ),
                              ],
                            ),
                          )
                        ],
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
