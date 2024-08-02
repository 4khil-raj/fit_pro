import 'package:fit_pro/application/auth_bloc/auth_bloc.dart';
import 'package:fit_pro/application/bloc/repsandweightworkout_bloc.dart';
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
// import 'package:flutter/material.dart';
// import 'package:stop_watch_timer/stop_watch_timer.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MainPage(),
//     );
//   }
// }

// class MainPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Plugin example app'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 4),
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => CountUpTimerPage()),
//                   );
//                 },
//                 child: const Text('Count Up Timer'),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 4),
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => CountDownTimerPage()),
//                   );
//                 },
//                 child: const Text('Count Down Timer'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CountUpTimerPage extends StatefulWidget {
//   @override
//   _CountUpTimerPageState createState() => _CountUpTimerPageState();
// }

// class _CountUpTimerPageState extends State<CountUpTimerPage> {
//   final StopWatchTimer _stopWatchTimer = StopWatchTimer();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Count Up Timer'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             StreamBuilder<int>(
//               stream: _stopWatchTimer.rawTime,
//               initialData: _stopWatchTimer.minuteTime.value,
//               builder: (context, snapshot) {
//                 final value = snapshot.data!;
//                 final displayTime = StopWatchTimer.getDisplayTime(value);
//                 return Text(
//                   displayTime,
//                   style: const TextStyle(
//                       fontSize: 40, fontWeight: FontWeight.bold),
//                 );
//               },
//             ),
//             ElevatedButton(
//               onPressed: _stopWatchTimer.onStartTimer,
//               child: const Text('Start'),
//             ),
//             ElevatedButton(
//               onPressed: _stopWatchTimer.onStopTimer,
//               child: const Text('Stop'),
//             ),
//             ElevatedButton(
//               onPressed: _stopWatchTimer.onResetTimer,
//               child: const Text('Reset'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _stopWatchTimer.dispose();
//   }
// }

// class CountDownTimerPage extends StatefulWidget {
//   @override
//   _CountDownTimerPageState createState() => _CountDownTimerPageState();
// }

// class _CountDownTimerPageState extends State<CountDownTimerPage> {
//   final StopWatchTimer _stopWatchTimer = StopWatchTimer(
//     presetMillisecond: StopWatchTimer.getMilliSecFromMinute(1),
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Count Down Timer'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             StreamBuilder<int>(
//               stream: _stopWatchTimer.rawTime,
//               initialData: _stopWatchTimer.rawTime.value,
//               builder: (context, snapshot) {
//                 final value = snapshot.data!;
//                 final displayTime = StopWatchTimer.getDisplayTimeMinute(value);
//                 return Text(
//                   displayTime,
//                   style: const TextStyle(
//                       fontSize: 40, fontWeight: FontWeight.bold),
//                 );
//               },
//             ),
//             ElevatedButton(
//               onPressed: _stopWatchTimer.onStartTimer,
//               child: const Text('Start'),
//             ),
//             ElevatedButton(
//               onPressed: _stopWatchTimer.onStopTimer,
//               child: const Text('Stop'),
//             ),
//             ElevatedButton(
//               onPressed: _stopWatchTimer.onResetTimer,
//               child: const Text('Reset'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _stopWatchTimer.dispose();
//   }
// }
