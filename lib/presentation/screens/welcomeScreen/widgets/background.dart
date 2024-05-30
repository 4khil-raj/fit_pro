import 'package:flutter/material.dart';

class WelcomeBackground extends StatelessWidget {
  const WelcomeBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 7, 2, 22),
          image: DecorationImage(
              opacity: 0.5,
              image: AssetImage(
                'assets/images/7df90fdb-01a8-49d7-bfb1-668c8d849ef0.jpg',
              ),
              fit: BoxFit.cover)),
    );
  }
}
