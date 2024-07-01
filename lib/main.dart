import 'package:fit_pro/application/auth_bloc/auth_bloc.dart';
import 'package:fit_pro/application/bloc/bottom_nav_bloc.dart';
import 'package:fit_pro/application/user_info/user_info_bloc.dart';
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
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await checkUserLogin(context);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    checkUserLogin(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => UserInfoBloc(),
        ),
        BlocProvider(
          create: (context) => BottomNavBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fit Pro',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: userlogin == "user" ? BottomNavBar() : WelcomeScreen(),
        // home: const BottomNavBar(),
      ),
    );
  }
}

dynamic userlogin;
Future<void> checkUserLogin(context) async {
  final sharedpreference = await SharedPreferences.getInstance();
  userlogin = sharedpreference.getString(loginTocken);

  // if (userlogin == 'user') {
  //   customNavRemoveuntil(context, const BottomNavBar());
  // } else {
  //   customNavRemoveuntil(context, const WelcomeScreen());
  // }
}
// import 'package:d_chart/commons/data_model.dart';
// import 'package:d_chart/ordinal/bar.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Home(),
//     );
//   }
// }

// class Home extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('D\'Chart')),
//       backgroundColor: const Color.fromARGB(255, 0, 0, 0),
//       body: ListView(
//         padding: EdgeInsets.all(16),
//         children: [
//           AspectRatio(
//             aspectRatio: 16 / 13,
//             child: DChartBarO(
//               groupList: [
//                 OrdinalGroup(
//                   color: Colors.white,
//                   id: '1',
//                   data: [
//                     // OrdinalData(domain: 'Mon', measure: 2),
//                     OrdinalData(
//                         domain: 'gfyfytdytd',
//                         measure: 6,
//                         color: Colors.amber,
//                         other: 0),
//                     OrdinalData(domain: 'Wed', measure: 3),
//                     OrdinalData(domain: 'Thu', measure: 7),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
