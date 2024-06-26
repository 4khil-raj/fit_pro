import 'package:fit_pro/application/bloc/bottom_nav_bloc.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/home.dart';
import 'package:fit_pro/presentation/screens/home/profile/profile.dart';
import 'package:fit_pro/presentation/screens/home/progress/progress.dart';
import 'package:fit_pro/presentation/screens/home/training/training.dart';
import 'package:fit_pro/presentation/screens/home/workout/workout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const Color constBottomnavColor = const Color.fromARGB(255, 81, 37, 114);

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});
  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const WorkOutScreen(),
    const TrainingScreen(),
    const ProgressScreen(),
    const ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBloc, BottomNavState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: _widgetOptions.elementAt(state.emittedIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: const Color.fromARGB(255, 81, 37, 114),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.dumbbell,
                  size: 23.0,
                ),
                label: 'Workout',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.model_training_rounded),
                label: 'Training',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.chartSimple,
                  size: 20.0,
                ),
                label: 'Progress',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            currentIndex: state.emittedIndex,
            selectedItemColor: Colors.amber,
            unselectedItemColor: Colors.white,
            onTap: (index) => BlocProvider.of<BottomNavBloc>(context)
                .add(BottomnavcallEvent(currentIndex: index)),
          ),
        );
      },
    );
  }
}
