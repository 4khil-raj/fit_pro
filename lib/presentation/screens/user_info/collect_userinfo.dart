import 'package:fit_pro/application/user_info/user_info_bloc.dart';
import 'package:fit_pro/domain/models/user_info/models.dart';
import 'package:fit_pro/infrastructure/user_info/repo.dart';
import 'package:fit_pro/presentation/screens/user_info/age/user_age.dart';
import 'package:fit_pro/presentation/screens/user_info/appbar.dart';
import 'package:fit_pro/presentation/screens/user_info/experience/experience.dart';
import 'package:fit_pro/presentation/screens/user_info/experience/widgets/buttons.dart';
import 'package:fit_pro/presentation/screens/user_info/finish/finish.dart';
import 'package:fit_pro/presentation/screens/user_info/gender/gender.dart';
import 'package:fit_pro/presentation/screens/user_info/gender/widgets/buttons.dart';
import 'package:fit_pro/presentation/screens/user_info/goal/goal.dart';
import 'package:fit_pro/presentation/screens/user_info/goal/widgets/custom_radio.dart';
import 'package:fit_pro/presentation/screens/user_info/height/height.dart';
import 'package:fit_pro/presentation/screens/user_info/weight/weight.dart';
import 'package:fit_pro/presentation/screens/user_info/workout/currently_workout.dart';
import 'package:fit_pro/presentation/screens/user_info/workout/days_workout.dart';
import 'package:fit_pro/presentation/screens/user_info/workout/widgets/currently_widget.dart';
import 'package:fit_pro/presentation/screens/user_info/workout/widgets/days_widgets.dart';
import 'package:fit_pro/presentation/widgets/custom_nav/customnav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserInfoCollectingScreen extends StatefulWidget {
  const UserInfoCollectingScreen({super.key});

  @override
  State<UserInfoCollectingScreen> createState() =>
      _UserInfoCollectingScreenState();
}

class _UserInfoCollectingScreenState extends State<UserInfoCollectingScreen> {
  double progressValue = .1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 6, 2, 19),
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 50),
          child: UserInfoAppBar(
            progressValue: progressValue,
          )),
      body: BlocBuilder<UserInfoBloc, UserInfoState>(
        builder: (context, state) {
          if (state is UserGenderSuccessState) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              setState(() {
                progressValue = .2;
              });
            });
            return const AgeSelectScreen();
          } else if (state is UserAgeSuccessState) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              setState(() {
                progressValue = .3;
              });
            });
            return const GoalSelectScreen();
          } else if (state is UserGoalSuccessState) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              setState(() {
                progressValue = .4;
              });
            });
            return HeightSelectScreen(
              values: state.value,
            );
          } else if (state is UserHeightSuccessState) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              setState(() {
                progressValue = .5;
              });
            });
            return const WeightCollectScreen();
          } else if (state is UserWeightSuccessState) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              setState(() {
                progressValue = .7;
              });
            });
            return const ExperienceSelectScreen();
          } else if (state is UserExperienceSuccessState) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              setState(() {
                progressValue = .8;
              });
            });
            return const CurrentlyWorkoutScreen();
          } else if (state is UserCurrentlyWorkoutState) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              setState(() {
                progressValue = 1;
              });
            });
            return const WorkoutDaysCollecterScreen();
          } else if (state is UserWorkoutDayState) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              // collectUserInfo();
              customNavRemoveuntil(context, const UserInfoFinishPage());
            });
          }
          return const GenderSelectScreen();
        },
      ),
    );
  }

  void collectUserInfo() {
    UserInfoModels userinfo = UserInfoModels(
        age: currentIntValueAge.toString(),
        gender: gender,
        weightValue: weightF.toString(),
        weightUnit: weightL.toString(),
        heightValue: heightF.toString(),
        heightUnit: heightL.toString(),
        goal: goal,
        experience: selectedOptionExperience,
        workoutType: currentlyWorkout,
        workoutFrequency: workoutFrequency);
    UserInfoRepo.collectUserInfo(userinfo);

    // print(userinfo.age);
  }
}
