import 'package:fit_pro/application/auth_bloc/auth_bloc.dart';
import 'package:fit_pro/application/superSetButtons/superset_buttons_bloc.dart';
import 'package:fit_pro/application/superset_checker/supersetscreencheckbox_bloc.dart';
import 'package:fit_pro/application/exercises_fetch/exercisefetchbloc_bloc.dart';
import 'package:fit_pro/application/reps&weight/repsandweightworkout_bloc.dart';
import 'package:fit_pro/application/category_bloc/category_fetch_bloc.dart';
import 'package:fit_pro/application/image_pic/imagepicker_bloc.dart';
import 'package:fit_pro/application/bottom_nav/bottom_nav_bloc.dart';
import 'package:fit_pro/application/fetch_bookmark_day/fetch_bookmark_bloc.dart';
import 'package:fit_pro/application/fetch_week/fetchweek_bloc.dart';
import 'package:fit_pro/application/forget_password/forgetpassword_bloc.dart';
import 'package:fit_pro/application/plan_overview/plan_overview_bloc.dart';
import 'package:fit_pro/application/start_workout/start_workout_bloc.dart';
import 'package:fit_pro/application/user_fetch/userfetch_bloc.dart';
import 'package:fit_pro/application/user_info/user_info_bloc.dart';
import 'package:fit_pro/application/wokout_screen_buttons/workout_screen_buttons_bloc.dart';
import 'package:fit_pro/application/workout_fetch/workoutfetch_bloc.dart';
import 'package:fit_pro/application/workout_plans/workoutplans_bloc.dart';
import 'package:fit_pro/firebase_options.dart';
import 'package:fit_pro/presentation/screens/auth/signin/signin.dart';
import 'package:fit_pro/presentation/screens/bottom_nav/bottom_nav.dart';
import 'package:fit_pro/presentation/screens/welcomeScreen/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(context) async {
  WidgetsFlutterBinding.ensureInitialized();
  getAccessTocken();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await checkUserLogin(context);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => StartWorkoutBloc()),
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => UserInfoBloc()),
        BlocProvider(create: (context) => BottomNavBloc()),
        BlocProvider(create: (context) => ForgetpasswordBloc()),
        BlocProvider(create: (context) => WorkoutplansBloc()),
        BlocProvider(create: (context) => PlanOverviewBloc()),
        BlocProvider(create: (context) => FetchweekBloc()),
        BlocProvider(create: (context) => UserfetchBloc()),
        BlocProvider(create: (context) => FetchBookmarkBloc()),
        BlocProvider(create: (context) => ImagepickerBloc()),
        BlocProvider(create: (context) => CategoryFetchBloc()),
        BlocProvider(create: (context) => WorkoutfetchBloc()),
        BlocProvider(create: (context) => RepsandweightworkoutBloc()),
        BlocProvider(create: (context) => WorkoutScreenButtonsBloc()),
        BlocProvider(create: (context) => ExercisefetchblocBloc()),
        BlocProvider(create: (context) => SupersetscreencheckboxBloc()),
        BlocProvider(create: (context) => SupersetButtonsBloc())
      ],
      child: MaterialApp(
        scrollBehavior:
            NoSplashScrollBehavior(), // Apply the custom scroll behavior
        debugShowCheckedModeBanner: false,
        title: 'Fit Pro',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:
            accesstocken != null ? const BottomNavBar() : const WelcomeScreen(),
      ),
    );
  }
}

class NoSplashScrollBehavior extends ScrollBehavior {
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

dynamic userlogin;
Future<void> checkUserLogin(context) async {
  final sharedpreference = await SharedPreferences.getInstance();
  userlogin = sharedpreference.getString(loginTockenkey);
}
