import 'package:fit_pro/application/workout_plans/workoutplans_bloc.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/widget/appbar.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/widget/bookmark.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/widget/bottom_carousel.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/widget/countinu_training.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/widget/featured_workouts.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/widget/photo_gellery.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/widget/quick_actions.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/widget/quick_trainings.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/widget/status.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/widget/tending_carousel.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/widget/top_carouserl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<WorkoutplansBloc>(context)
        .add(WorkoutPlanFetchRequestEvent());
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 6, 2, 19),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeScreenAppBar(),
            CarouselPremiumPage(),
            QuickActionsHomeScreen(),
            ContinueTrainingScreen(),
            FeaturedWorkoutsScreen(),
            BlocBuilder<WorkoutplansBloc, WorkoutplansState>(
              builder: (context, state) {
                if (state is WorkoutplansFetchedSuccessState) {
                  return BottomCaroselSlider(
                    list: state.list,
                  );
                } else if (state is WorkoutPlansFetchErrorState) {
                  print("error");
                }
                return Text("No data");
              },
            ),
            TrendingCaroselSlider(),
            QuickTrainingScreen(),
            StatusSqureContainer(),
            BookMarkScreenHome(),
            PhotoGalleryScreenHome()
          ],
        ),
      ),
    );
  }
}
