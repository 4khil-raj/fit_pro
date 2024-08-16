import 'package:fit_pro/application/fetch_bookmark_day/fetch_bookmark_bloc.dart';
import 'package:fit_pro/application/user_fetch/userfetch_bloc.dart';
import 'package:fit_pro/application/workout_fetch/workoutfetch_bloc.dart';
import 'package:fit_pro/application/workout_plans/workoutplans_bloc.dart';
import 'package:fit_pro/infrastructure/repository/temp_category/temp.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/widget/appbar.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/widget/bookmark.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/widget/bottom_carousel.dart';
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
    // CategoriesRepositoryFetchTemap.fetchCompletedCategories();
    BlocProvider.of<WorkoutplansBloc>(context)
        .add(WorkoutPlanFetchRequestEvent());
    BlocProvider.of<UserfetchBloc>(context).add(UserFetchReq());
    BlocProvider.of<FetchBookmarkBloc>(context)
        .add(FetchBookmarkReq(dayId: ""));

    BlocProvider.of<WorkoutfetchBloc>(context).add(WorkoutFetch());

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 6, 2, 19),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HomeScreenAppBar(),
            const CarouselPremiumPage(),
            const QuickActionsHomeScreen(),
            // ContinueTrainingScreen(), ith api integration tymil set akkanam
            const FeaturedWorkoutsScreen(),
            BlocBuilder<WorkoutplansBloc, WorkoutplansState>(
              builder: (context, state) {
                if (state is WorkoutplansFetchedSuccessState) {
                  return BottomCaroselSlider(
                    list: state.list,
                  );
                } else if (state is WorkoutPlansFetchErrorState) {
                  return const SizedBox();
                }
                return const SizedBox();
              },
            ),
            const TrendingCaroselSlider(),
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
