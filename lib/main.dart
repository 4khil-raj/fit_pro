import 'package:fit_pro/application/auth_bloc/auth_bloc.dart';
import 'package:fit_pro/application/bottom_nav/bottom_nav_bloc.dart';
import 'package:fit_pro/application/fetch_week/fetchweek_bloc.dart';
import 'package:fit_pro/application/forget_password/forgetpassword_bloc.dart';
import 'package:fit_pro/application/plan_overview/plan_overview_bloc.dart';
import 'package:fit_pro/application/start_workout/start_workout_bloc.dart';
import 'package:fit_pro/application/user_fetch/userfetch_bloc.dart';
import 'package:fit_pro/application/user_info/user_info_bloc.dart';
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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fit Pro',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:
            accesstocken != null ? const BottomNavBar() : const WelcomeScreen(),
        // home: const BottomNavBar(),
      ),
    );
  }
}

dynamic userlogin;
Future<void> checkUserLogin(context) async {
  final sharedpreference = await SharedPreferences.getInstance();
  userlogin = sharedpreference.getString(loginTockenkey);
}
