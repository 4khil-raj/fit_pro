import 'package:fit_pro/presentation/screens/welcomeScreen/widgets/background.dart';
import 'package:fit_pro/presentation/screens/welcomeScreen/widgets/positioned.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      //addcoloum on positioned
      body: Stack(children: [WelcomeBackground(), CustomPositioned()]),
    ));
  }
}
